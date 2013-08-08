class CreateProviderFacebookPages < ActiveRecord::Migration
  def change
    create_table :provider_facebook_pages do |t|
      t.integer :provider_id
      t.string :fb_page_id

      t.timestamps
    end
  end
end
