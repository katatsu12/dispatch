class CreateNewsChoosers < ActiveRecord::Migration[5.1]
  def change
    create_table :news_choosers do |t|
      t.string :news_types

      t.timestamps
    end
  end
end
