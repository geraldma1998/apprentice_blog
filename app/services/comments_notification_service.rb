# frozen_string_literal: true

class CommentsNotificationService

  def initialize(params)
    @users = Post.get_users_from_post_comments(params[:post_id])
    @post = Post.find(params[:post_id])
    @owner = @post.user
  end

  # CommentNotificationMailer.send_notification(@current_user,post).deliver_later
  def send_comment_notification
    @users.each do |user|
      CommentNotificationMailer.send_notification(user, @post).deliver_later
    end
    CommentNotificationMailer.send_notification(@owner, @post).deliver_later unless @users.include? @owner
  end

end
