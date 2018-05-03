require 'rails_helper'
RSpec.describe NewsChooserController, type: :controller do
  describe 'get defs' do
    let!(:user) { User.create(email: 'example@example.example', password: 'example') }
    let!(:id) { User.current = user  }
    it 'GET index template with created notification' do
      Notification.create(email: 'aome@some.some', user_id: user.id)
      sign_in(user)
      get :index
      expect(response.status).to eq(200)
    end
    it 'GET index template without created notification' do
      sign_in(user)
      get :index
      expect(response).to redirect_to(root_path)
    end
    describe 'POST defs' do
      let!(:user) { User.create(email: 'example@example.example', password: 'example') }
      let!(:id) { User.current = user  }
      let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
      let(:news_chooser) { NewsChooser.where(user_id: user.id).last }
      let(:send_daily) { NewsChooser.where(user_id: user.id).last.send_daily }
      let(:send_weekly) { NewsChooser.where(user_id: user.id).last.send_weekly }
      it 'send_daily' do
        sign_in(user)
        post :send_daily
        expect(send_daily).to eq 1
      end
      it 'send_weekly' do
        sign_in(user)
        post :send_weekly
        expect(send_weekly).to eq 1
      end
      it 'us_business' do
        sign_in(user)
        post :us_business
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[0]).to eq '1'
      end
      it 'us_entertainment' do
        sign_in(user)
        post :us_entertainment
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[1]).to eq '1'
      end
      it 'us_health' do
        sign_in(user)
        post :us_health
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[2]).to eq '1'
      end
      it 'us_science' do
        sign_in(user)
        post :us_science
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[3]).to eq '1'
      end
      it 'us_sports' do
        sign_in(user)
        post :us_sports
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[4]).to eq '1'
      end
      it 'us_technology' do
        sign_in(user)
        post :us_technology
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[5]).to eq '1'
      end
      it 'ua_business' do
        sign_in(user)
        post :ua_business
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[6]).to eq '1'
      end
      it 'ua_entertainment' do
        sign_in(user)
        post :ua_entertainment
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[7]).to eq '1'
      end
      it 'ua_health' do
        sign_in(user)
        post :ua_health
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[8]).to eq '1'
      end
      it 'ua_science' do
        sign_in(user)
        post :ua_science
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[9]).to eq '1'
      end
      it 'ua_sports' do
        sign_in(user)
        post :ua_sports
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[10]).to eq '1'
      end
      it 'ua_technology' do
        sign_in(user)
        post :ua_technology
        arr = news_chooser.news_types.each_char.to_a
        expect(arr[11]).to eq '1'
      end
    end
  end
end
