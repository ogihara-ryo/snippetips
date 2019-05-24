class User < ApplicationRecord
  def profile_image_url
    image_url.gsub('normal', '400x400')
  end
end
