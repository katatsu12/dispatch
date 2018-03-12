class NewsMailer < ApplicationMailer

  def bbc_news
    #@user = users
    mail to:      'katatsu12@gmail.com',
         subject: 'BBC News'
  end
end
