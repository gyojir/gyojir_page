if Rails.env.production?
  Cloudinary.config do |config|
    config.secure = true
  end
end