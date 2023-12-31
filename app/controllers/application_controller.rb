class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def layout_by_resource
      if devise_controller? && action_name != "edit"
        "devise"
      else
        "application"
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_pic_url, :profile_pic])
    end
end
