class AddProcessedAtToDataFileUploads < ActiveRecord::Migration
  def change
    add_column :data_file_uploads, :processed_at, :datetime
  end
end
