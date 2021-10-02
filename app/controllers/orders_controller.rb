class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:scheduled_at, :comments, :status, :client_id, :address_id)
    end

end
