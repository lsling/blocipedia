class ConfirmMailer < ApplicationMailer
  default from: "laura.sling@gmail.com"

  def confirm_email(current_user)
    @current_user = current_user
    @url  = 'https://dry-coast-33228.herokuapp.com/'
    mail(to: current_user.email, subject: 'Welcome to Blocipedia')
  end
end
