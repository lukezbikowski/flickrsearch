class Photo
  PER_PAGE = 100

  def self.find_by_text text, page = 0
    unless text.blank?
      flickr_photo.search text: text, page: page, per_page: PER_PAGE,
        extras: "url_q,url_z"
    else
      []
    end
  end

private

  def self.flickr_photo
    @flickr_photo ||= flickr.photos
  end
end
