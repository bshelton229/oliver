module BootstrapHelper
  # Define the main navigation links
  def navbar_items
    [
      {
        name: 'Users',
        link: users_path,
        active: -> { controller_name == 'users' }
      }
    ]
  end

  # Generate the navbar <ul>
  def navbar
    content_tag :ul, navbar_items.map { |item| navbar_link(item[:name], item[:link], item[:active]) }.join.html_safe, class: 'nav navbar-nav'
  end

  # Generate a single navbar <li>
  def navbar_link(name, path, active=false)
    if active.kind_of?(Proc)
      active = active.call
    end
    content_tag(:li, link_to(name, path), class: active ? 'active' : '')
  end
end
