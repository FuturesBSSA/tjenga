class DeveloperMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.developer_mailer.welcome.subject
  #
  def welcome(developer)
    @developer = developer  # Instance variable => available in view

    mail(to: @developer.email, subject: "#{@developer.first_name} welcome to Tjenga")
    # This will render a view in `app/views/user_mailer`!
  end
end
