class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :region
      t.string :postal_code
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
    add_index :addresses, :city
    add_index :addresses, :region
    add_index :addresses, :postal_code
    add_index :addresses, :addressable_id
    add_index :addresses, :addressable_type
  end
end
