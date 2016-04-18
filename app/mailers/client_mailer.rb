class ClientMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.welcome.subject
  #

 def welcome(client)
    @client = client  # Instance variable => available in view

    mail(to: @client.email, subject: ' #{@client.first_name} welcome to Tjenga')
    # This will render a view in `app/views/user_mailer`!
  end

end
