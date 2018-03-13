class NewsMailer < ApplicationMailer

  def news_send
    mail to:      'example@gmail.com',
         subject: 'BBC News'
  end
end
