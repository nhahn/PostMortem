class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_type_id
      t.string :username
      t.string :password
      t.integer :user_id

      t.timestamps
    end
  end
end
