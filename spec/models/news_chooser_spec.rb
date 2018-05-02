require 'rails_helper'
RSpec.describe NewsChooser, type: :model do
  context 'model defs' do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:news_chooser) { NewsChooser.where(user_id: user.id).last }
    # news_types_changer---------------------------------------------------
    it 'perform news_types_changer 1 time to get 1' do
      NewsChooser.news_types_changer(0, user.id)
      news_chooser = NewsChooser.where(user_id: user.id).last
      ec = news_chooser.news_types.each_char.to_a
      expect(ec[0]).to eq('1')
    end
    it 'perform news_types_changer 2 times to get 0' do
      NewsChooser.news_types_changer(0, user.id)
      NewsChooser.news_types_changer(0, user.id)
      news_chooser = NewsChooser.where(user_id: user.id).last
      ec = news_chooser.news_types.each_char.to_a
      expect(ec[0]).to eq('0')
    end
    # send_daily_changer---------------------------------------------------
    it 'perform send_daily_changer 1 time to get 1' do
      NewsChooser.send_daily_changer(user.id)
      news_chooser = NewsChooser.where(user_id: user.id).last
      expect(news_chooser.send_daily).to eq(1)
    end
    it 'perform send_daily_changer 2 time to get 0' do
      NewsChooser.send_daily_changer(user.id)
      NewsChooser.send_daily_changer(user.id)
      news_chooser = NewsChooser.where(user_id: user.id).last
      expect(news_chooser.send_daily).to eq(0)
    end
    # send_weekly_changer---------------------------------------------------
    it 'perform send_weekly_changer 1 time to get 1' do
      NewsChooser.send_weekly_changer(user.id)
      news_chooser = NewsChooser.where(user_id: user.id).last
      expect(news_chooser.send_weekly).to eq(1)
    end
    it 'perform send_weekly_changer 2 time to get 0' do
      NewsChooser.send_weekly_changer(user.id)
      NewsChooser.send_weekly_changer(user.id)
      news_chooser = NewsChooser.where(user_id: user.id).last
      expect(news_chooser.send_weekly).to eq(0)
    end
  end
end
