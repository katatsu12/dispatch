class Task < ApplicationRecord
  belongs_to :user
  after_create do
    task = Task.where(:user_id == NewsChooser.current_user).last
    TaskMailer.delay_until(task.time).index(NewsChooser.current_user , task.id)
    Task.delay_until(task.time).sended_email(task.id)
  end
  private

  def self.sended_email(task_id)
    task = Task.find(task_id)
    task.update(:sended => 1)
  end
end
