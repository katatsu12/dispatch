require 'rails_helper'
RSpec.describe TagedNews, type: :model do
  context 'after_create ' do
    let!(:user) { User.create(email: 'aome@some.somee', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:taged_news_true) { TagedNews.create(tag: 'john wick', user_id: user.id) }
    let!(:taged_news_false) { TagedNews.create(tag: 'awefawefawef', user_id: user.id) }
    it 'query status ok' do
      tag_true = TagedNews.find(taged_news_true.id)
      expect(tag_true.status).to eq('ok')
    end
    it 'query status bad request' do
      tag_false = TagedNews.find(taged_news_false.id)
      expect(tag_false.status).to eq('bad request')
    end
  end
end
