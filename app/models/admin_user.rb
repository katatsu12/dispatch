class AdminUser < ApplicationRecord
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
end
