require 'open-uri'
# require 'JSON'

class NewsController < ApplicationController

  def index #test
    @news_chooser = NewsChooser.where(user_id: current_user).last
    @a = @news_chooser.news_types.each_char.to_a

    @index = 0
    @arr = [ method(:bbc)  , method(:tc) ,
          method(:us) , method(:us) ,method(:us) ,method(:us) ,method(:us) ,method(:us) ,
            method(:ua) ,method(:ua) ,method(:ua) ,method(:ua) ,method(:ua) ,method(:ua)]


  end

  def bbc #take top 20 news from BBC
    url = 'https://newsapi.org/v2/top-headlines?'\
          'sources=bbc-news&'\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)

  end


  def tc #take top 20 news from techcrunch
    url = 'https://newsapi.org/v2/top-headlines?'\
          'sources=techcrunch&'\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end

  def us(param = "sport") #us news with params
    url = 'https://newsapi.org/v2/top-headlines?'\
          'country=us&'\
          "category=#{param}&"\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end

  def ua(param = "sport") #ua news with params
    url = 'https://newsapi.org/v2/top-headlines?'\
          'country=ua&'\
          "category=#{param}&"\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    open_url(url)
  end
  #
  # def ru(param) #ru news with params
  #   url = 'https://newsapi.org/v2/top-headlines?'\
  #         'country=ru&'\
  #         "category=#{param}&"\
  #         'apiKey=6dd59350f84a476490213e76baf5d95b'
  #   open_url(url)
  # end
  #
  # def uk(param) #uk news with params
  #   url = 'https://newsapi.org/v2/top-headlines?'\
  #         'country=uk&'\
  #         "category=#{param}&"\
  #         'apiKey=6dd59350f84a476490213e76baf5d95b'
  #   open_url(url)
  # end

  def open_url(url) #open JSON and conver it to array
    req = open(url)
    @response_body = req.read
    a = JSON.parse(@response_body)
    $b = a.to_a
  end

end
