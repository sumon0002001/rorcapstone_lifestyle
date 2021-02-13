module ApplicationHelper
  def handle_vote(article)
    if voted?(article)
      content_tag(:p, 'You have already voted this article', class: 'font-weight-bold mt-3')
    else
      link_to 'Vote', add_vote_path(article_id: article.id),
              class: 'text-center w-25 mt-3 mb-3 p-2 bg-info text-white rounded nav-link m-auto'
    end
  end

  def show_votes?(article)
    return unless article.votes.count.positive?

    content_tag(:p, "#{article.votes.count} vote(s)",
                class: 'w-50 m-auto font-weight-bold mt-3 alert alert-success rounded p-1')
  end

  def user
   # if current_user
     # content_tag(:li, link_to( 'Home','/', class: ' p-2 text-dark nav-link'))
     # content_tag(:li, link_to("3", users_path))
   # else
     # link_to "Registration", new_user_path, class: "nav-link text-light" 
   #   link_to "Sign In", new_user_path, class: "nav-link text-light" 
   #   content_tag(:li, link_to("3", users_path))
   #   content_tag(:li, link_to("4", users_path))
    #render partial: 'navbar' 
    #render partial: 'navbar2' 
  #  end

  end

  def nav_items
    [
        {
            url: root_path,
            title: "Home"
        },
        {
            url: '#',
            title: "About Us"
        },
        {
            url: '#',
            title: "Sounds"
        }
    ]

end

def nav_helper(style="",tag_type="")
    nav_links = ''

    nav_items.each do |item| 
        nav_links 
    end

    nav_links.html_safe
end

def active?(path)
    "active" if current_page?(path)
end

def login_helper(style="")
    if current_user
      content_tag(:li, link_to("CreateArticle", new_article_path, class: "nav-link")) + " ".html_safe +
      content_tag(:li, link_to("CreateCategory", new_category_path, class: "nav-link")) + " ".html_safe +
      content_tag(:li, link_to("LogOut", "/logout", class: " nav-link text-dark"))

    else
        
      content_tag(:li, link_to("Sign In","/login", class: "nav-link text-dark")) + " ".html_safe +
      content_tag(:li, link_to("Registration", new_user_path, class: "nav-link text-dark")) + " ".html_safe 
            
            

    end
end






end
