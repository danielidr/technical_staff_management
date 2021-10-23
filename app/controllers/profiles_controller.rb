class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    orders = Order.where(created_by_id: current_user.id).or(Order.where(user_id: current_user.id))
    @orders = orders.order(scheduled_at: :ASC)

    if current_user.role.id == 2
      @orders_status = Order.where(user_id: current_user.id).group(:status).count
      @orders_finished = Order.where(status: 3, user_id: current_user.id).group_by_week(:updated_at, last: 8).count
    else
      @count = Order.where(status: 3).group(:user).count
      @orders_status = Hash.new
      @count.map { |hash|
      @orders_status[hash[0].name] = hash[1]
      }
      # @count2 = Order.where(status: 3).group(:user_id).group_by_week(:updated_at, last: 8).count
      # @orders_status2 = Hash.new
      # @count.map { |hash|
      # @orders_status2[hash[0].name] = hash[1]
      # }
    end
  end
end
