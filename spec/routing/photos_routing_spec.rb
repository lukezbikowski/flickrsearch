require 'rails_helper'

RSpec.describe "Photos routes" do
  describe "GET /" do
    it "routes to #index" do
      expect(get: "/").to route_to(action: "index", controller: "photos")
    end
  end

  describe "GET /photos" do
    it "routes to #index" do
      expect(get: "/photos").to route_to(action: "index", controller: "photos")
    end
  end

  describe "GET /photo/:id" do
    it "raises routes exeception" do
      expect(get: "/photo/1").not_to be_routable
    end
  end
end
