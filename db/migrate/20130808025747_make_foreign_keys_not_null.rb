class MakeForeignKeysNotNull < ActiveRecord::Migration
  def change
    change_column_null :provider_displays, :provider_id, false
    change_column_null :provider_facebook_pages, :provider_id, false
    change_column_null :provider_facebook_pages, :fb_page_id, false
  end
end
