ActiveAdmin.register User do
  config.sort_order = 'admin DESC, provider_id, provider_admin DESC, email'

  menu priority: 2

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit admin_user: [:email, :password, :password_confirmation]
    end
  end

  scope_to :current_user, :association_method => :administerable_users
end
