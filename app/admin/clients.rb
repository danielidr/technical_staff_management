ActiveAdmin.register Client do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :rut, :email, :phone, :address_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :rut, :email, :phone, :address_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :first_name
    column :last_name
    column :rut
    column :email
    column :phone
    column :address do |client|
      client.address.full_address
    end
    column :updated_at
    actions
  end

  form do |f|
    inputs 'Agregar un nuevo usuario' do
      input :first_name
      input :last_name
      input :rut
      input :email
      input :phone
      f.input :address_id,
        label: 'Address',
        as: :select,
        collection: Address.pluck(:full_address, :id)
    end
    actions
  end
  
  filter :rut, as: :select
end
