class AccountType < ActiveRecord::Base
  attr_accessible :name, :permissions, :username_regex, :content

  serialize :permissions
  has_many :accounts
  
  validates_uniqueness_of :name
 

end
