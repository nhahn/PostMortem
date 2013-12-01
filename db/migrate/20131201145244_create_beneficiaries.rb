class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :zip
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.string :relationship

      t.timestamps
    end
  end
end
