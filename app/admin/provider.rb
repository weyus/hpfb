ActiveAdmin.register Provider do
  decorate_with ProviderDecorator

  #This doesn't appear to work with the decorator
  #config.sort_order = 'name'

  controller do
    def permitted_params
      params.permit provider: [:name, :scss_filename]
    end
  end

  form do |f|
    f.inputs "Provider Details" do
      f.input :name
      f.input :scss_filename
    end
    f.actions
  end

  filter :name
  filter :users

  index do
    column :name
    column :fb_page_id do |provider|
      link_to provider.fb_page_id, "http://facebook.com/#{provider.fb_page_id}" if provider.fb_page_id
    end
    column :scss_filename
    default_actions
  end

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
