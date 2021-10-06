ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :name, :role_id, :is_active
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :email
    column :name
    column :role
    column :is_active
    column :created_at
    column :updated_at
    column :actions do |item|
      links = []
      links << link_to('Show', admin_user_path(item.id))
      links << link_to('Edit', edit_admin_user_path(item.id))
      links.join(' ').html_safe
    end
  end

  form do |f|
    inputs 'Agregar un nuevo usuario' do
      input :email
      input :password
      input :name
      f.input :role_id,
        label: 'Role',
        as: :select,
        collection: Role.pluck(:name, :id)
      input :is_active
    end
    actions
  end

  filter :email, as: :select
  filter :is_active

  controller do
    def update
      if (params[:user][:password].blank? && params[:user] [:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
    super 
    end
  end
  
end
