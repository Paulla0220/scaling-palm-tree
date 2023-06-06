ActiveAdmin.register Pumpup do
  menu label: 'Pompki'

  permit_params :series, :rep, :date, :user_id

  index do
    selectable_column
    id_column
    column 'Użytkownik', :user
    column 'Seria', :series
    column 'Powtórzenie', :rep
    column 'Data', :date
    column 'Data utworzenia', :created_at
    column 'Data modyfikacji', :updated_at
    actions
  end

  filter :user, label: 'Użytkownik'
  filter :series, label: 'Seria'
  filter :rep, label: 'Powtórzenie'
  filter :date, label: 'Data'
  filter :created_at, label: 'Data utworzenia'
  filter :updated_at, label: 'Data modyfikacji'

    form do |f|
      f.inputs do
        f.input :user_id
        f.input :series
        f.input :rep
        f.input :date, label: I18n.t('active_admin.pumpups.date')
      end
      f.actions
    end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :series, :rep, :date, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:series, :rep, :date, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end  
end
