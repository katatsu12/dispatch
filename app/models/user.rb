class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notifications
  has_many :news_choosers
  has_many :tasks

  after_create do
    UserRegistrationMailer.delay.welcome_email(User.last)
  end
end
