class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
