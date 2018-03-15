require 'open-uri'

class NewsMailer < ApplicationMailer
  def index(current_user) # test
    @news_chooser = NewsChooser.where(user_id: current_user).last
    @a = @news_chooser.news_types.each_char.to_a
    @email_to_send = Notification.where(user_id: current_user).last

    @index = 0
    @arr = [method(:bbc), method(:tc),
            method(:us), method(:us), method(:us), method(:us), method(:us), method(:us),
            method(:ua), method(:ua), method(:ua), method(:ua), method(:ua), method(:ua)]

    @news_a = ['BBC', 'TechCrunch' , 'us_business', 'us_entertainment', 'us_health' \
              , 'us_science', 'us_sports', 'us_technology', 'ua_business' \
              , 'ua_entertainment', 'ua_health', 'ua_science' , 'ua_sports' , 'ua_technology']


    mail to: "#{@email_to_send.email}"
  end

  def bbc # take top 20 news from BBC
    url = 'https://newsapi.org/v2/top-headlines?'\
          'sources=bbc-news&'\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end

  def tc # take top 20 news from techcrunch
    url = 'https://newsapi.org/v2/top-headlines?'\
          'sources=techcrunch&'\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end

  def us(param = 'business') # us news with params
    url = 'https://newsapi.org/v2/top-headlines?'\
          'country=us&'\
          "category=#{param}&"\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end

  def ua(param = 'business') # ua news with params
    url = 'https://newsapi.org/v2/top-headlines?'\
          'country=ua&'\
          "category=#{param}&"\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end

  private

  def open_url(url) # open JSON and conver it to array
    req = open(url)
    @response_body = req.read
    a = JSON.parse(@response_body)
    $b = a.to_a
  end
end
