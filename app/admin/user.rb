ActiveAdmin.register User do
  config.sort_order = 'admin DESC, provider_id, provider_admin DESC, email'

  controller do
    helper_method :current_user

    def update
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
      super
    end

    def permitted_params
      params.permit user: [:email, :password, :password_confirmation, :provider_id, :admin, :provider_admin]
    end
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password, required: f.object.new_record?
      f.input :password_confirmation, required: f.object.new_record?
      f.input :provider, collection: current_user.administerable_providers, include_blank: current_user.admin?
      f.input :admin if current_user.admin?
      f.input :provider_admin
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
