class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  private

    def layout_by_resource
      if devise_controller? && action_name != "edit"
        "devise"
      else
        "application"
      end
    end
end
