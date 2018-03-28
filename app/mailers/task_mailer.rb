class TaskMailer < ApplicationMailer
  def index(current_user , id) # test
    @email_to_send = Notification.where(user_id: current_user).last
    @task = Task.where(id: id).last
    mail(to: "#{@email_to_send.email}", subject: "#{@task.title}")
  end
end
