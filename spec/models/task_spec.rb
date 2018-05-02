require 'rails_helper'
require 'sidekiq/testing'
RSpec.describe Task, type: :model do
  context 'defs' do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user  }
    let!(:task) { Task.create(title: 'expected', text: 'expected', time: Date.today, user_id: user.id, sended: 0) }
    it 'sended_email' do
      Task.sended_email(task.id)
      sended_task = Task.find(task.id)
      expect(sended_task.sended).to eq(1)
    end
  end
  context 'creation' do
    let!(:user) { User.create(email: 'aome@some.some', password: 'somepass') }
    let!(:id) { User.current = user }
    let!(:notification) { Notification.create(email: 'aome@some.some', user_id: user.id) }
    let!(:task) { Task.create(title: 'expected', text: 'expected', time: Date.today, user_id: user.id, sended: 0) }
    it 'creation' do
      expect(task.title).to eq('expected')
    end
  end
end
