class RemoveSendChooseFromNewsChooser < ActiveRecord::Migration[5.1]
  def change
    remove_column :news_choosers, :send_choose, :integer
  end
end
