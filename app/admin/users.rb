ActiveAdmin.register User do
  permit_params :email, :name, :surname, :nick, :age, :password, :password_confirmation
 
  index do
    selectable_column
    id_column
    column :email
    column :updated_at
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :surname
      f.input :nick
      f.input :age
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :surname, :nick, :age]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
