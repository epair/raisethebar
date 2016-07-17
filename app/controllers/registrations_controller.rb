class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up(resource_name, resource)
  end

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

end
