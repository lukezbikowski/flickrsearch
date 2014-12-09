require 'rails_helper'

RSpec.describe PhotoHelper, :type => :helper do
  before(:each) do
    allow(helper).to receive(:render).and_return("<tag />")
  end

  context "for two photos" do
    it "calls render twice" do
      photo = "anyObject"
      photos = [photo, photo]

      expect(helper).to receive(:render).with({partial: "photo", object: photo}).twice

      helper.render_photos(photos)
    end

    it "renders concatenated photos" do
      photo  = "anyObject"
      photos = [photo, photo]
      expected = "<tag /><tag />"

      rendered_photos = helper.render_photos(photos)

      expect(rendered_photos).to eq(expected)
    end

    it "returns html_safe string" do
      photo  = "anyObject"
      photos = [photo, photo]
      rendered_photos = helper.render_photos(photos)

      expect(rendered_photos).to be_html_safe
    end
  end
end
