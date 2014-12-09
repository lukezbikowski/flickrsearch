module SimplePaginationHelper
  def next_button
    unless next_page.nil?
      link_to "Next", params_with(next_page)
    else
      disabled_link "Next"
    end
  end

  def previous_button
    unless previous_page.nil?
      link_to "Previous", params_with(previous_page)
    else
      disabled_link "Previous"
    end
  end

private

  def current_page
    @current_page ||= params[:page].to_i
  end

  def current_photos_count
    @photos.size
  end

  def disabled_link text
    link_to text, "#", class: "disabled"
  end

  def params_with page_number
    params.merge page: page_number
  end

  def next_page
    unless current_photos_count<Photo::PER_PAGE
      current_page+1
    end
  end

  def previous_page
    if current_page>0
      current_page-1
    end
  end
end
