class NewsDeliverJob < ApplicationJob
  queue_as :default

  def perform
    users_for_send = NewsChooser.where(:send_choose => 1)
    users_for_send.each do |u|
      NewsMailer.index(u.user_id).deliver
    end
  end
end
