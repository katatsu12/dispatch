require 'rails_helper'
RSpec.describe Notification, type: :model do
  context 'after_create' do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:news_chooser) { NewsChooser.where(user_id: user.id).last }
    it 'create news news_chooser string' do
      expect(news_chooser.news_types).to eq('000000000000')
    end
  end

  context 'Notification creation' do #dadaya
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    it 'when create notification without user.id' do
      notification = Notification.create(email: 'some@some.some')
      expect(notification.valid?).to eq(false)
    end

    it 'when create notification without email' do
      notification = Notification.create(user_id: User.current.id)
      expect(notification.valid?).to eq(false)
    end

    it 'when create notification with bad email' do
      notification = Notification.create(email: 'someasdfawe')
      expect(notification.valid?).to eq(false)
    end
    it 'when create notification with good params' do
      notification = Notification.create(email: 'aome@some.some', user_id: user.id)
      expect(notification.valid?).to eq(true)
    end
  end
end
