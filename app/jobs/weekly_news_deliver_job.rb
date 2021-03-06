class WeeklyNewsDeliverJob < ApplicationJob
  queue_as :default

  def perform
    Statistic.all.update(current_weekly_subs: "0")
    users_for_send = NewsChooser.where(:send_weekly => 1)
    users_for_send.each do |u|
      NewsMailer.send_weekly(u.user_id).deliver
    end
  end
end
