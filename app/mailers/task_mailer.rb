class TaskMailer < ApplicationMailer

  def index(current_user , task_id) # test
    @email_to_send = Notification.where(user_id: current_user).last
    @task = Task.where(id: task_id).last
    mail(to: "#{@email_to_send.email}", subject: "#{@task.title}")
  end
end
