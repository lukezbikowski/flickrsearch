require 'rails_helper'

RSpec.describe SimplePaginationHelper, type: :helper do

  before (:each) do
    allow(helper).to receive(:params).and_return({page: 1})
  end

  describe "Previous button" do
    it "calls link_to with previous page for current page number > 0" do
      params = {page: 1}
      allow(helper).to receive(:params).and_return(params)

      expect(helper).to receive(:link_to).with("Previous", {page: 0})

      helper.previous_button
    end

    it "calls link_to with # and class disabled when current page == 0" do
      params = {page: 0}
      allow(helper).to receive(:params).and_return(params)

      expect(helper).to receive(:link_to).with("Previous", "#",
        class: "disabled")

      helper.previous_button
    end

    it "link_to passes all parameters" do
      params  = {page: 1, a: "a", b: "b", abc: "abc"}
      link_params = {page: 0, a: "a", b: "b", abc: "abc"}

      allow(helper).to receive(:params).and_return(params)

      expect(helper).to receive(:link_to).with("Previous", link_params)

      helper.previous_button
    end
  end

  describe "Next button" do
    it "calls link_to with next page when last photos count==Photo:PER_PAGE" do
      params = {page: 0}
      allow(helper).to receive(:params).and_return(params)
      allow(helper).to receive(:current_photos_count).and_return(100)

      expect(helper).to receive(:link_to).with("Next", {page: 1})

      helper.next_button
    end

    it "calls link_to with # and class disabled when " <<
        "last photos count<100" do
      params = {page: 0}
      allow(helper).to receive(:params).and_return(params)
      allow(helper).to receive(:current_photos_count).and_return(99)

      expect(helper).to receive(:link_to).with("Next", "#", class: "disabled")

      helper.next_button
    end

    it "link_to passes all parameters" do
      params  = {page: 1, a: "a", b: "b", abc: "abc"}
      link_params = {page: 2, a: "a", b: "b", abc: "abc"}

      allow(helper).to receive(:params).and_return(params)
      allow(helper).to receive(:current_photos_count).and_return(100)

      expect(helper).to receive(:link_to).with("Next", link_params)

      helper.next_button
    end
  end
end
