module HomeHelper
  def page page_num, text, valid = true, ending_dots = true
    active=(valid)? "" : "disabled"
    url=(valid)? page_path(page_num) : "#"
    link=link_to text, url
    content_tag :li, link, class: active
  end
  
  def current_page page_num
    link=link_to page_num, page_path(page_num)
    content_tag :li, link, class: "active"
  end
  
  def add_favorite number
    link_to "(Add)", favorites_path(favorite:{number: number}, page: @page), method: :post, class: "btn-sm btn-success"
  end
  
  def remove_favorite number
    link_to "(Remove)", favorite_path(Favorite.find_by(number: number), page: @page), method: :delete, class: "btn-sm btn-danger"
  end
end
