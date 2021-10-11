module Api
    module V1
        class SlotController < V1Controller

            def get_slots
                tech = params[:user_id]
                date = DateTime.parse(params[:scheduled_at]).to_date
                orders_info = Order.where(user_id: tech).where(scheduled_at: date.all_day)
                render json: json_structure(orders_info)
            end

            private

            def json_structure(orders)
                array = []
                orders.each do |order|
                    h = {}
                    h['id'] = order.id
                    h['user_id'] = order.user_id
                    h['scheduled_slot'] = order.scheduled_at.strftime('%H')
                    array.push(h)
                end
                array
            end
            
        end
    end
end