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
    b = NewsPacker.taged_news_daily_taker(last_taged_news.tag)
    if b[1][1] == 0
      last_taged_news.update(:status => 'bad')
    else
      last_taged_news.update(:status => 'ok')
    end
  end
end
