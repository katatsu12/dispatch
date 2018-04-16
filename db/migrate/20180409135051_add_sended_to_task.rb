class AddSendedToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :sended, :integer
  end
end
