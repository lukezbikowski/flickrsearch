require 'rails_helper'

RSpec.describe Photo, :type => :model do
  describe "Photo#find_by_text" do
    it "calls flickr search with proper params" do
      flickr_photos = double()
      search_params = {text: "query_text", page: 1, per_page: 100,
        extras: "url_q,url_z"}
      allow(Photo).to receive(:flickr_photo).and_return(flickr_photos)

      expect(flickr_photos).to receive(:search).with(search_params)

      Photo.find_by_text search_params[:text], search_params[:page]
    end
  end
end
