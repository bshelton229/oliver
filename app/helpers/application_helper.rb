module ApplicationHelper
  # Produces a page header with a new link
  def page_header(title,new_link)
    content_tag :div, class: 'page-header' do
      content_tag :h1 do
        (title + link_to(fa_icon('plus')+' New', new_link, class: 'pull-right btn btn-primary header-new-btn')).html_safe
      end
    end
  end
end
