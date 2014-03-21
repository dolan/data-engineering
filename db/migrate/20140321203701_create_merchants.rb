class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name

      t.timestamps
    end
    add_index :merchants, :name
  end
end
