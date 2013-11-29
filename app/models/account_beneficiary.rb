class AccountBeneficiary < ActiveRecord::Base
  attr_accessible :account_id, :beneficiary_id, :permission
end
