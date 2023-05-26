ActiveAdmin.register Pumpup do
  permit_params :series, :rep, :date, :user_id

  index do
    selectable_column
    id_column
    column :user
    column :series
    column :rep
    column :date
    column :updated_at
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :series
      f.input :rep
      f.input :date
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
