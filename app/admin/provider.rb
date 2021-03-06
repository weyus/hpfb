ActiveAdmin.register Provider do
  decorate_with ProviderDecorator

  #This doesn't appear to work with the decorator
  config.sort_order = 'name_asc'

  controller do
    def permitted_params
      params.permit provider: [:name]
    end
  end

  form partial: 'form'

  filter :name
  filter :users, collection: proc {current_user.administerable_users}

  index do
    column :name
    column :facebook_page do |provider|
      link_to provider.fb_page_id, "http://facebook.com/#{provider.fb_page_id}", target: '_blank' if provider.fb_page_id
    end

    actions do |provider|
      if can? :link_facebook, provider
        link_to('Link Facebook Page', facebook_page_integration_link, class: 'member_link') +
        link_to('View User Site', healthpost_url(provider.id), class: 'member_link', target: '_blank')
      end
    end
  end

  scope_to :current_user, :association_method => :administerable_providers

  show do |provider|
    attributes_table do
      row :name
      row :fb_page_id do
        link_to provider.fb_page_id, "http://facebook.com/#{provider.fb_page_id}", target: '_blank' if provider.fb_page_id
      end
    end
  end
end
