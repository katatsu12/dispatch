require 'task_packer'
module TaskPacker

  def self.nearest_tasks(current_user)

    if Task.where(user_id: current_user , sended: 0).count > 0
      nearest_tasks = Task.where(user_id: current_user , sended: 0).order(:time).first(3)
    else
      nearest_tasks = "Recently you don't have upcoming tasks"
    end

    return nearest_tasks
  end

end
