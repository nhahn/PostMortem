class CreateAccountBeneficiaries < ActiveRecord::Migration
  def change
    create_table :account_beneficiaries do |t|
      t.integer :account_id
      t.integer :beneficiary_id
      t.string :permission

      t.timestamps
    end
  end
end
