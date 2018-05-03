require 'rails_helper'
RSpec.describe NotificationsController , type: :controller do
  context "defs" do
    let!(:user) { User.create(email: 'example@example.example', password: 'example') }
    let!(:id) { User.current = user  }
    it 'GET index with Notification' do
      Notification.create(email: 'aome@some.some', user_id: user.id)
      sign_in(user)
      get :index
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
    it 'GET index without Notification' do
      sign_in(user)
      get :index
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
    it 'GET statistics without Notification' do
      sign_in(user)
      get :statistics
      expect(response).to render_template("statistics")
      expect(response.status).to eq(200)
    end
  end
end
