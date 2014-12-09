require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do
  before (:each) do
    allow(Photo).to receive(:find_by_text).and_return([])
  end

  describe "GET index" do
    it "assigns @photos" do
      get :index
      expect(assigns(:photos)).to eq([])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "pass only 'query' and 'page' params to Photo#find_by_text" do
      text = "query_text"
      page = "1"
      abc  = "abc"

      expect(Photo).to receive(:find_by_text).with(text, page)

      get :index, query: text, page: page, abc: abc
    end
  end
end
