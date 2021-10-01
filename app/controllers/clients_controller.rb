class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all
    end

    def show
    end

    def new
        @client = Client.new
    end

    def edit
    end

    def create
        @client = Client.new(client_params)
        puts "************#{params.inspect}"
        address = Address.create(full_address: params[:client][:full_address])
        @client.address_id = address.id

        respond_to do |format|
            if @client.save
            format.html { redirect_to @client, notice: 'Client was successfully created.' }
            format.json { render :show, status: :created, location: @client }
            else
            format.html { render :new }
            format.json { render json: @client.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @client.update(client_params)
            format.html { redirect_to @client, notice: 'Client was successfully updated.' }
            format.json { render :show, status: :ok, location: @client }
            else
            format.html { render :edit }
            format.json { render json: @client.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @client.destroy
        respond_to do |format|
            format.html { redirect_to pets_url, notice: 'Client was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :rut, :email, :phone)
    end
end
