require 'rails_helper'
RSpec.describe TaskMailer, type: :mailer do
  context 'mailer titles' do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:task) { Task.create(title: 'expected' , text: 'expected' , user_id: user.id ) }
    let(:task_email) { TaskMailer.index(user.id , task.id) }
    it 'index' do
      expect(task_email.subject).to eq(task.title)
      expect(task_email.to).to eq([notification.email])
      expect(task_email.from).to eq(['dispatch.rails@localhost.com'])
      expect(task_email.body.encoded).to match(task.text)
    end

  end
end
