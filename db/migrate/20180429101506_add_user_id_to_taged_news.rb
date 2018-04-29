class AddUserIdToTagedNews < ActiveRecord::Migration[5.1]
  def change
    add_column :taged_news, :user_id, :integer
    add_index :taged_news, :user_id
  end
end
