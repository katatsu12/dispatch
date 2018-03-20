require 'open-uri'
require 'news_packer'

class NewsMailer < ApplicationMailer
  def index(current_user) # test

    @arr_with_news = NewsPacker.news_packer(current_user)
    @email_to_send = Notification.where(user_id: current_user).last
    mail(to: "#{@email_to_send.email}", subject: 'News Dispatch')
  end

end
