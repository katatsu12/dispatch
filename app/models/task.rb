class Task < ApplicationRecord
  belongs_to :user
  after_create do
    task = Task.where(:user_id == User.current).last
    TaskMailer.delay_until(task.time).index(User.current , task.id)
    Task.delay_until(task.time).sended_email(task.id)
  end
  private

  def self.sended_email(task_id)
    task = Task.find(task_id)
    task.update(:sended => 1)
  end
end
