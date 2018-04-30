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
    if last_taged_news.tag.include? ' '
      last_taged_news_updated = last_taged_news.tag.gsub!(' ', '+')
    else
      last_taged_news_updated = last_taged_news.tag
    end
    b = NewsPacker.taged_news_daily_taker(last_taged_news_updated)
    if b[1][1] == 0
      last_taged_news.update(status: 'bad request' , tag: last_taged_news_updated)
    else
      last_taged_news.update(status: 'ok', tag: last_taged_news_updated)
    end
  end
end
