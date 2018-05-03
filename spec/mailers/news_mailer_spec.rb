require 'rails_helper'
RSpec.describe NewsMailer, type: :mailer do
  context 'mailer titles' do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:news_chooser) { NewsChooser.where(user_id: user.id).last }
    let(:mail_daily) { NewsMailer.send_daily(user.id) }
    let(:mail_weekly) { NewsMailer.send_weekly(user.id) }
    it 'send_daily' do
      expect(mail_daily.subject).to eq('Daily News Dispatch')
      expect(mail_daily.to).to eq([notification.email])
      expect(mail_daily.from).to eq(['dispatch.rails@localhost.com'])
    end
    it 'send_weekly' do
      expect(mail_weekly.subject).to eq('Weekly News Dispatch')
      expect(mail_weekly.to).to eq([notification.email])
      expect(mail_weekly.from).to eq(['dispatch.rails@localhost.com'])
    end
  end
end
