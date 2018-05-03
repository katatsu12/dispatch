require "rails_helper"
RSpec.describe UserRegistrationMailer , type: :mailer do
  context "welcome email" do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let(:welcome_email) { UserRegistrationMailer.welcome_email(user.id) }
    it 'check welcome email' do
      expect(welcome_email.subject).to eq('Welcome')
      expect(welcome_email.to).to eq([user.email])
      expect(welcome_email.from).to eq(['dispatch.rails@localhost.com'])
      expect(welcome_email.body.encoded).to match("Hello aome@some.some")
    end
  end
end
