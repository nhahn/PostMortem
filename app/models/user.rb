class User < ActiveRecord::Base
  attr_accessible :deceased, :dob, :email, :first_name, :last_name, :password_digest, :phone, :state, :street, :zip
end
