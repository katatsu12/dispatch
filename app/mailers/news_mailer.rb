require 'open-uri'
require 'news_packer'

class NewsMailer < ApplicationMailer

  def send_daily(current_user)
    @arr_with_news = NewsPacker.news_packer_daily(current_user)
    @email_to_send = Notification.where(user_id: current_user).last
    mail(to: @email_to_send.email.to_s, subject: 'Daily News Dispatch')
  end

  def send_weekly(current_user)
    @arr_with_news = NewsPacker.news_packer_weekly(current_user) # change this after def create
    @email_to_send = Notification.where(user_id: current_user).last
    mail(to: @email_to_send.email.to_s, subject: 'Weekly News Dispatch')
  end

end
