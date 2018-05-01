require 'rails_helper'
RSpec.describe Notification, type: :model do
  context 'after_create' do
    let!(:user) { User.create(email: "aome@some.some" , password: "somepass" )}
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: "aome@some.some" , user_id: user.id ) }
    let!(:news_chooser) { NewsChooser.where(user_id: user.id).last }
    it 'create news' do
      expect(news_chooser.news_types).to eq("000000000000")
    end
  end
end
