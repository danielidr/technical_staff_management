ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :scheduled_at, :comments, :status, :client_id, :address_id, :user_id, :created_by_id
  
  filter :user, as: :select
  filter :created_by, as: :select

  form do |f|
    inputs 'Agregar una nueva orden' do
      input :scheduled_at
      input :comments
      input :status
      input :user
      input :created_by
      f.input :client_id,
        label: 'Client',
        as: :select,
        collection: Client.pluck(:rut, :id)
    end
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:scheduled_at, :comments, :status, :client_id, :address_id, :user_id, :created_by_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
