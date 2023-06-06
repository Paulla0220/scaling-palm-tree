ActiveAdmin.register User do
  menu label: 'Użytkownicy'
  

  permit_params :email, :name, :surname, :nick, :age, :password, :password_confirmation
 
  filter :name, label: 'Imię'
  filter :surname, label: 'Nazwisko'
  filter :nick
  filter :age, label: 'Wiek'
  filter :email
  filter :created_at, label: 'Data utworzenia'
  filter :updated_at, label: 'Data modyfikacji'
  
  index do
    selectable_column
    id_column
    column :email
    column 'Data utworzenia', :created_at
    column 'Data modyfikacji', :updated_at
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
