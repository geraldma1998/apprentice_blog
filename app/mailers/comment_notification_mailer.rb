# frozen_string_literal: true

class CommentNotificationMailer < ApplicationMailer

  default from: "example@email.com"

  def send_notification(user, post)
    @user = user
    @post = post
    subject_message = "Comment notification"
    mail(to: @user.email, subject: subject_message)
  end

end
