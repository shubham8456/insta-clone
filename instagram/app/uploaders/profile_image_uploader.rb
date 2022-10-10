class ProfileImageUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick

    storage :aws
  
    # Override the directory where uploaded files will be stored.
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    # Process files as they are uploaded:
    # process :scale => [300, 300]
    
    # def scale(width, height)
    #   # do something
    # end
  
    # Create different versions of your uploaded files:
    process resize_to_fit: [298, 298]
  
    # version :thumb do
    #   process resize_to_fill: [200,200]
    # end
  
    def extension_allowlist
      %w(jpg jpeg png)
    end
  
  end