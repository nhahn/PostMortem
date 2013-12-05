class Account < ActiveRecord::Base
  attr_accessible :account_type_id, :password, :type, :user_id, :username

  belongs_to :account_type
  belongs_to :user

  has_many :account_beneficiaries, dependent: :destroy
  has_many :beneficiaries, through: :account_beneficiaries

  validates_presence_of :username, :user, :account_type, :password

  def proper_name
    "#{self.account_type.name}: #{self.username}"
  end

end
