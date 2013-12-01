class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.datetime :dob
      t.string :street
      t.integer :zip
      t.string :state
      t.string :phone
      t.string :password_digest
      t.string :last_name
      t.string :first_name
      t.boolean :deceased

      t.timestamps
    end
  end
end
