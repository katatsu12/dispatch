class AddSendChooseToNewsChoosers < ActiveRecord::Migration[5.1]
  def change
    add_column :news_choosers, :send_choose, :integer
  end
end
