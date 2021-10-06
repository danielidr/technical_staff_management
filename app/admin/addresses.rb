ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_address, :latitude, :longitude

  index do
    column :id
    column :full_address
    column :latitude
    column :longitude
    column :created_at
    column :updated_at
  end

  filter :full_address

  #
  # or
  #
  # permit_params do
  #   permitted = [:full_address, :latitude, :longitude]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
