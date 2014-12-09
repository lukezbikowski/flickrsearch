module PhotoHelper
  include SimplePaginationHelper

  def render_photos photos
    rendered_photos = ""

    photos.each do |photo|
      rendered_photos += render partial: "photo", object: photo
    end

    rendered_photos.html_safe
  end
end
