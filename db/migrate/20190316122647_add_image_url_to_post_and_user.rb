class AddImageUrlToPostAndUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_url, :string, null: false, default: ''
    add_column :posts, :image_url, :string, null: false, default: ''
  end
end
