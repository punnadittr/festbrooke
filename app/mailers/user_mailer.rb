class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'https://festbrooke.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to FestBrooke')
  end
end
