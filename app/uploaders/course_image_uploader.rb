class CourseImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
version :product do
    process resize_to_fit: [300, 311]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
