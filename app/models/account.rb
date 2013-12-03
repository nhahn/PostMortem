class Account < ActiveRecord::Base
  attr_accessible :account_type_id, :password, :type, :user_id, :username

  belongs_to :account_type
  belongs_to :user

  has_many :account_beneficiaries
  has_many :beneficiaries, through: :account_beneficiaries


end
