require 'open-uri'

class NewsMailer < ApplicationMailer

  def index #test
    url = 'https://newsapi.org/v2/top-headlines?'\
          'country=us&'\
          "category=business&"\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)

    mail to: 'example@gmail.com'
  end

private
  def open_url(url) #open JSON and conver it to array
    req = open(url)
    @response_body = req.read
    a = JSON.parse(@response_body)
    @b = a.to_a
  end
end
