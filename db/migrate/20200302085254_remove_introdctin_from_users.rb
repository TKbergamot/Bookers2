class RemoveIntrodctinFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introdctin, :text
  end
end
