class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price

      t.timestamps
    end
    add_index :items, :description
  end
end
