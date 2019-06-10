# frozen_string_literal: true

module ApplicationHelper

  def users_nav_options
    content_tag(:ul, class: "navbar-nav ml-auto") do
      if current_user
        if current_user.has_roles?(:admin)
          admin_li_tags
        elsif current_user.has_roles?(:client)
          client_li_tags
        end
      else
        guest_li_tags
      end
    end
  end

  def li_tag_path(name, path, method)
    content_tag(:li, class: "nav-item") do
      link_to name, path, class: "nav-link", method: method
    end
  end

  def guest_li_tags
    concat li_tag_path "Home", root_path, :get
    concat li_tag_path "Login", new_user_session_path, :get
    concat li_tag_path "Register", new_user_registration_path, :get
  end

  def client_li_tags
    concat li_tag_path "Home", root_path, :get
    concat li_tag_path "Ranking", rankings_path, :get
    concat li_tag_path "Logout", destroy_user_session_path, :delete
  end

  def admin_li_tags
    concat li_tag_path "Home", root_path, :get
    concat li_tag_path "Ranking", rankings_path, :get
    concat li_tag_path "Logout", destroy_user_session_path, :delete
  end

  def set_user_information_post
    content_tag(:span, class: "meta") do
      concat "Posted by "
      concat link_to @post.user.username, @post.user
      concat " "
      concat time_ago_in_words @post.created_at
      concat " ago"
    end
  end

  def user_create_post
    (link_to "Create post", new_post_path, class: "btn btn-primary") + content_tag(:hr) if current_user
  end

  def add_start_by_post_ranking(user_ranking)
    star_titles = ["Very bad", "Poor", "Ok", "Good", "Excellent"]
    star_class = ""
    number_stars = 5
    content_tag(:span, id: "rateMe") do
      number_stars.times do |n|
        star_class = n <= user_ranking ? "amber-text" : ""
        concat li_for_ranking n, star_titles[n], star_class
      end
    end
  end

  def li_for_ranking(index, title, star_class)
    content_tag(:li, "",
                class: ("fas fa-star py-2 px-1 rate-popover " + star_class),
                "data-index": index,
                "data-html": "true",
                "data-toggle": "popover",
                "data-placement": "top",
                title: title)
  end

end
