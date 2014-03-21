require 'csv'

class TabFileProcessingService
  attr_reader :data_file_upload

  def initialize(data_file_upload_or_id)
    @data_file_upload = (data_file_upload_or_id.kind_of?(DataFileUpload) ? data_file_upload_or_id : DataFileUpload.find(data_file_upload_or_id))
  end

  def process
    purchases = []

    return purchases unless @data_file_upload.processed_at.blank?

    CSV.parse(File.open(::Rails.root.join(@data_file_upload.data_file.current_path)), { col_sep: "\t", headers: true}).each do |row|
      begin
        customer_name = row[0]
        item_description = row[1]
        item_price = row[2]
        quantity = row[3]
        merchant_street_address = row[4]
        merchant_name = row[5]

        ActiveRecord::Base.transaction do
          begin
            customer = Customer.find_or_create_by!(name: customer_name.strip.titleize)
            item = Item.find_or_create_by!(description: item_description, price: BigDecimal.new(item_price.to_s))
            merchant = Merchant.find_or_initialize_by(name: merchant_name)
            if merchant.new_record?
              merchant.build_address(street: merchant_street_address)
              merchant.save!
            end

            purchase = Purchase.new
            purchase.customer = customer
            purchase.item = item
            purchase.merchant = merchant
            purchase.quantity = quantity.to_i
            purchase.save
            purchases << purchase
          rescue Exception => e

            puts e.to_s
            sleep 5

            raise ActiveRecord::Rollback
          end
        end # transaction
      rescue Exception => e
        # skip bad lines in the CSV
      end
    end # parse

    @data_file_upload.update_attributes(processed_at: Time.now, total_income: purchases.map{|p| p.purchase_amount}.inject(:+))

    purchases
  end
end
