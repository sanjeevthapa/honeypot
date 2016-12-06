class CreateSiteInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :site_infos do |t|
      t.string :facebook
      t.string :twitter
      t.string :gplus
      t.string :linkedin
      t.string :location
      t.string :phone_no
      t.string :email
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
