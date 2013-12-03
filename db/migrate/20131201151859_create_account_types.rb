class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :name
      t.string :username_regex
      t.text :permissions

      t.timestamps
    end
  end
end
