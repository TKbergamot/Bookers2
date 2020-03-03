class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introdctin, :text
    add_column :users, :profile_image_id, :string
  end
end
