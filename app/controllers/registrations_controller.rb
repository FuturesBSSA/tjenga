class RegistrationsController <  Devise::RegistrationsController
  protected

  def after_update_path_for(resource)
    developer_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo, :photo_cache)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :phone_number, :city, :address, :photo, :photo_cache)
  end
end
