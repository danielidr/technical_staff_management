class HomeController < ApplicationController

  before_action :set_statuses
  
  def index
    if current_user!=nil && current_user.role.name == "Técnico"
      orders = Order.where(user_id: current_user.id)
      @q = orders.includes(:client).ransack(params[:q])
      @orders = @q.result(distinct: true)
    else
      @q = Order.includes(:client).ransack(params[:q])
      @orders = @q.result(distinct: true)
    end
  end

  private

    def set_statuses
      @statuses = Order.statuses.keys
    end
end
