class CreateTagedNews < ActiveRecord::Migration[5.1]
  def change
    create_table :taged_news do |t|
      t.string :tag
      t.string :status

      t.timestamps
    end
  end
end
