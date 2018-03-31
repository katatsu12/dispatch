
class Task < ApplicationRecord
  belongs_to :user
  after_create do
    task = Task.where(:user_id == NewsChooser.current_user).last
    TaskMailer.delay_until(task.time).index(NewsChooser.current_user , task.id)
  end
end
