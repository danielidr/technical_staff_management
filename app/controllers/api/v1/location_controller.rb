module Api
    module V1
        class LocationController < V1Controller
            def save_location
                order_id = params[:order_id]
                lat = params[:latitude]
                lon = params[:longitude]
                order = Order.find(order_id.to_i)
                order.status = 1
                if order.address == nil
                    address = Address.new
                    address.latitude = lat
                    address.longitude = lon
                    address.full_address = Geocoder.address([lat, lon])
                    order.address = address
                else
                    order.address.latitude = lat
                    order.address.longitude = lon
                    order.address.full_address = Geocoder.address([lat, lon])
                    order.address.save
                end
                order.save
                render status: 200, json: @controller.to_json
            end
        end
    end
end