class Account < ActiveRecord::Base
  attr_accessible :password, :type, :user_id, :username
end
