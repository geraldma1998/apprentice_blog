# frozen_string_literal: true

class CommentsNotificationService

  def initialize(params)
    find_post params
    @users = @post.users_in_comments
    @owner = @post.user
  end

  def send_comment_notification
    @users.each do |user|
      CommentNotificationMailer.send_notification(user, @post).deliver_later
    end
    CommentNotificationMailer.send_notification(@owner, @post).deliver_later unless @users.include? @owner
  end

  private

  def find_post(params)
    @post = Post.find(params[:post_id])
  end

end
