class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :item, index: true
      t.decimal :quantity
      t.references :customer, index: true
      t.references :merchant, index: true

      t.timestamps
    end
  end
end
