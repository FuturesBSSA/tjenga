ActiveAdmin.register Client do
  permit_params :first_name, :last_name, :email, :city, :address, :photo
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
 index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :city
    column :company
    column :address
    column :photo
    column :phone_number
    actions
  end


end
