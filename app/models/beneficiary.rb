class Beneficiary < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :phone, :relationship, :state, :street, :zip

  has_many :account_beneficiaries
  has_many :accounts, through: :account_beneficiaries

end
