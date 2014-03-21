class CreateDataFileUploads < ActiveRecord::Migration
  def change
    create_table :data_file_uploads do |t|
      t.string :note, default: "Uploaded file"
      t.string :data_file
      t.decimal :total_income, default: 0.0

      t.timestamps
    end
  end
end
