class UserMailer < ActionMailer::Base
  default from: "jermspeaks@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://flitr.herokuapp.com/login'
    mail(to: @user.email, subject: 'You\'ve just started flyin\' high!')
  end
end
