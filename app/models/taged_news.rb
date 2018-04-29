require 'open-uri'
require 'news_packer'
class TagedNews < ApplicationRecord
  belongs_to :user

  after_create do
    last_taged_news = TagedNews.where(:user_id == User.current.id).last
    TagedNews.status_check(last_taged_news)
  end

  private

  def self.status_check(last_taged_news)
    @url = NewsPacker.taged_news_daily_taker(last_taged_news.tag)
    req = open(@url)
    response_body = req.read
    a = JSON.parse(response_body)
    b = a.to_a
    if b[1][1] == 0
      last_taged_news.update(:status => 'bad')
    else
      last_taged_news.update(:status => 'ok')
    end
  end
end
