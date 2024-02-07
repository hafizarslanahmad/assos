class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user, pass)
        @user = user
        @pass = pass
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
      end
end
