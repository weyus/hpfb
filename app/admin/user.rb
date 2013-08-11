ActiveAdmin.register User do
  config.sort_order = 'admin DESC, provider_id, provider_admin DESC, email'

  controller do
    def permitted_params
      params.permit user: [:email, :password, :password_confirmation]
    end
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

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  menu priority: 2

  scope_to :current_user, :association_method => :administerable_users
end
