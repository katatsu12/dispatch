class AddTimesToNewsChooser < ActiveRecord::Migration[5.1]
  def change
    add_column :news_choosers, :send_daily, :integer
    add_column :news_choosers, :send_weekly, :integer
  end
end
