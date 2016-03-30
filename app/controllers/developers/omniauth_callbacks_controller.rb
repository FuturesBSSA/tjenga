class Developers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    developer = Developer.find_for_linkedin_oauth(request.env['omniauth.auth'])

    if developer.persisted?
      sign_in_and_redirect developer, event: :authentication
      set_flash_message(:notice, :success, kind: 'linkedin') if is_navigational_format?
    else
      session['devise.linkedin_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
