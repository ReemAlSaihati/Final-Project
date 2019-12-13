ActiveAdmin.register Message do
  permit_params :sender_id, :sender_username, :receiver_id, :receiver_username, :sender_venmo, :receiver_venmo, :message_sent, :sent_since, :sent_since_date


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
  
end
