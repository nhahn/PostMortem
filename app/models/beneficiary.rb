class Beneficiary < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :phone, :relationship, :state, :street, :zip
end
