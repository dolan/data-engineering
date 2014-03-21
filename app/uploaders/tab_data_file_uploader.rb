class TabDataFileUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    %w(tab txt csv tsv)
  end
end
