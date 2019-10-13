class CreateTwitters < ActiveRecord::Migration[5.2]
  def change
    create_table :twitters do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :image_url

      t.timestamps
    end
    add_index :twitters,[:provider,:uid],unique:true
  end
end
