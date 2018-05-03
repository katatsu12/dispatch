class UserRegistrationMailer < ApplicationMailer

  def welcome_email(current_user)
    @email_to_send = User.where(id: current_user).last
    mail(to: "#{@email_to_send.email}", subject: "Welcome")
  end
end
