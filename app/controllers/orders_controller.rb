class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_client, only: [:edit, :new, :create]
  before_action :set_user, only: [:edit, :new, :create]
  before_action :set_slots

  def index
    if params[:q]
      if current_user.role == "Técnico"
        orders = Order.where(user_id: current_user.id)
        @q = orders.includes(:client).ransack(params[:q])
        @orders = @q.result(distinct: true)
      else
        @q = Order.includes(:client).ransack(params[:q])
        @orders = @q.result(distinct: true)
      end
    else
      @orders = Order.all
    end
  end

  def show
    
  end

  def new
  end

  def edit
  end
  
  def create
    respond_to do |format|

      @order = Order.new(order_params)
      slot = params[:order][:time_slot].to_i
      @order.scheduled_at = @order.scheduled_at.time + slot.hours
      @order.created_by = current_user
        if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        end
    end
end

def update
    respond_to do |format|
        if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
        else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        end
    end
end

def destroy
    @order.destroy
    respond_to do |format|
        format.html { redirect_to orders_path, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
    end
end

  private

    def set_slots
      @slots = { "8:00 - 10:00" => "8", "10:00 - 12:00" => "10", "13:00 - 15:00" => "13", "15:00 - 17:00" => "15", "17:00 - 19:00" => "17"}
    end  

    def set_client
      @clients = Client.pluck :rut, :id
    end

    def set_user
      users = User.includes(:role).where(role_id: 2)
      @users = users.pluck :name, :id
    end

    def order_params
      params.require(:order).permit(:scheduled_at, :comments, :status, :client_id, :address_id, :user_id)
    end

end
