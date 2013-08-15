ActiveAdmin.register Provider do
  decorate_with ProviderDecorator

  #This doesn't appear to work with the decorator
  config.sort_order = 'name_asc'

  controller do
    def permitted_params
      params.permit provider: [:name, :scss_filename]
    end
  end

  form partial: 'form'

  filter :name
  filter :users, collection: proc {current_user.administerable_users}

  index do
    column :name
    column :facebook_page do |provider|
      link_to provider.fb_page_id, "http://facebook.com/#{provider.fb_page_id}" if provider.fb_page_id
    end
    column :scss_filename

    actions do |provider|
      link_to 'Link Facebook Page', FACEBOOK_PAGE_INTEGRATION_LINK if can? :link_facebook, provider
    end
  end

  scope_to :current_user, :association_method => :administerable_providers

  show do |provider|
    attributes_table do
      row :name
      row :fb_page_id do
        link_to provider.fb_page_id, "http://facebook.com/#{provider.fb_page_id}" if provider.fb_page_id
      end
      row :scss_filename
    end
  end
end
