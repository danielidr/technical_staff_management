class ClientsController < InheritedResources::Base

  private

    def client_params
      params.require(:client).permit(:first_name, :last_name, :rut, :email, :phone)
    end

end
