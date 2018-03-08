class Notification < ApplicationRecord
  validates_email_format_of :email
end
