class ProfilesController < ApplicationController
  def index
    @orders = Order.all
  end
end
