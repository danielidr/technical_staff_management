class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do
        redirect_to root_path, alert: "Acceso Denegado!"
    end
end
