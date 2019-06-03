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
    concat li_tag_path "Ranking", users_path, :get
    concat li_tag_path "Logout", destroy_user_session_path, :delete
  end

  def admin_li_tags
    concat li_tag_path "Home", root_path, :get
    concat li_tag_path "Users", users_path, :get
    concat li_tag_path "Posts", posts_path, :get
    concat li_tag_path "Categories", categories_path, :get
    concat li_tag_path "PostsCategories", posts_categories_path, :get
    concat li_tag_path "Comments", comments_path, :get
    concat li_tag_path "Rankings", rankings_path, :get
    concat li_tag_path "Logout", destroy_user_session_path, :delete
  end

  def set_user_information_post
    content_tag(:span, class: "meta") do
      concat "Posted by "
      concat link_to @post_home.user.username, @post_home.user
      concat " "
      concat time_ago_in_words @post_home.created_at
      concat " ago"
    end
  end

end
