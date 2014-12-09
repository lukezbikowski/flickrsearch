class PhotosController < ApplicationController
  def index
    photos
  end

private

  def photos
    @photos ||= Photo.find_by_text params[:query], params[:page]
  end
end
