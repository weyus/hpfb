class CreateProviderDisplays < ActiveRecord::Migration
  def change
    create_table :provider_displays do |t|
      t.integer :provider_id
      t.string :scss_filename

      t.timestamps
    end
  end
end
