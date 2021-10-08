class ProfilesController < ApplicationController
  def index
    orders = Order.where(created_by_id: current_user.id).or(Order.where(user_id: current_user.id))
    @orders = orders.order(scheduled_at: :ASC)
  end
end
