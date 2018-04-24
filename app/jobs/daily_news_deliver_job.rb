class DailyNewsDeliverJob < ApplicationJob
  queue_as :default

  def perform
    users_for_send = NewsChooser.where(:send_daily => 1)
    users_for_send.each do |u|
      NewsMailer.send_daily(u.user_id).deliver
    end
  end
end
