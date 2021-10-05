class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_client, only: [:edit, :new, :create]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
    respond_to do |format|
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
        if @order.update(client_params)
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

    def set_client
      @clients = Client.pluck :rut, :id
    end

    def order_params
      params.require(:order).permit(:scheduled_at, :comments, :status, :client_id, :address_id)
    end

end
