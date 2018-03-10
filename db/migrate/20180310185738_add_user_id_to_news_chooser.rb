class AddUserIdToNewsChooser < ActiveRecord::Migration[5.1]
  def change
    add_column :news_choosers, :user_id, :integer
    add_index :news_choosers, :user_id
  end
end
