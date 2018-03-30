class Task < ApplicationRecord
  belongs_to :user
  after_create do
    task = Task.where(:user_id == NewsChooser.current_user).last
    TaskMailer.index(NewsChooser.current_user , task.id).deliver
  end
end
