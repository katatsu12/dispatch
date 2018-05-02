require 'news_packer'
require 'rails_helper'
RSpec.describe NewsPacker do
  context 'defs' do
    let!(:user) { User.create(email: 'aome@some.somee', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:news_chooser) { NewsChooser.where(user_id: user.id).last }
    let!(:taged_news) { TagedNews.create(tag: 'apple', user_id: user.id) }
    #-------------------------------------------------------------------
    it 'news_packer_daily returns 9 elements' do
      news_chooser.update(news_types: '100000000000')
      arr = NewsPacker.news_packer_daily(user.id)
      expect(arr.count).to eq (6)
    end
    it 'news_packer_daily returns 9 elements' do
      news_chooser.update(news_types: '100000000000')
      arr = NewsPacker.news_packer_daily(user.id)
      if arr.include?(nil)
        arr_has_nil = true
      else
        arr_has_nil = false
      end
      expect(arr_has_nil).to eq (false)
    end
    #-------------------------------------------------------------------
    it 'news_packer_weekly returns 9 elements' do
      news_chooser.update(news_types: '100000000000')
      arr = NewsPacker.news_packer_weekly(user.id)
      expect(arr.count).to eq (6)
    end
    it 'news_packer_weekly returns 9 elements' do
      news_chooser.update(news_types: '100000000000')
      arr = NewsPacker.news_packer_weekly(user.id)
      if arr.include?(nil)
        arr_has_nil = true
      else
        arr_has_nil = false
      end
      expect(arr_has_nil).to eq (false)
    end
    #-------------------------------------------------------------------
    it 'choosed_news returns string with choosed news' do
      news_chooser.update(news_types: '100000000000')
      NewsPacker.news_packer_weekly(user.id)
      labels = NewsPacker.get_labels
      expect(labels).to eq (["business:", "apple:"])
    end
    #-------------------------------------------------------------------
    it 'choosed_news returns string with news' do
      news_chooser.update(news_types: '100000000000')
      arr = NewsPacker.choosed_news(user.id)
      expect(arr).to eq ("You are subscrivbed to this news: us business, apple")
    end
  end
  context "defs without taged_news" do
    let!(:user) { User.create(email: 'aome@some.somee', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:news_chooser) { NewsChooser.where(user_id: user.id).last }
    it 'choosed_news returns string without news' do
      arr = NewsPacker.choosed_news(user.id)
      expect(arr).to eq ("You are not subscrivbed to news")
    end
    it 'news_taker_daily' do
      arr = NewsPacker.news_taker_daily('ua' , 'business')
      expect(arr.count).to eq (3)
    end
    it 'news_taker_weekly' do
      arr = NewsPacker.news_taker_weekly('ru' , 'business')
      expect(arr.count).to eq (3)
    end
    #-------------------------------------------------------------------
    it 'news_taker_daily' do
      arr = NewsPacker.taged_news_daily_taker('apple')
      expect(arr.count).to eq (3)
    end
    it 'news_taker_weekly' do
      arr = NewsPacker.taged_news_weekly_taker('apple')
      expect(arr.count).to eq (3)
    end
  end
end
