class CreateProviderFacebookPages < ActiveRecord::Migration
  def change
    create_table :provider_facebooks do |t|
      t.integer :provider_id
      t.string :fb_page_id

      t.timestamps
    end
  end
end
