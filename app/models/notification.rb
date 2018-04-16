class Notification < ApplicationRecord
  validates_email_format_of :email
  belongs_to :user

  after_create do
    NewsChooser.create(:news_types => '0'*12, :send_choose => 0, :send_daily => 0, :send_weekly => 0 , :user_id => NewsChooser.current_user).save
  end
end
