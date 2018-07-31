class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def welcome_email(user)
    @user = user
    @url  = 'https://festbrooke.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to FestBrooke')
  end
end