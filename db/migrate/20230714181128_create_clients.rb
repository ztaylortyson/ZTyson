class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :dob
      t.string :ssn
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :ec_name
      t.string :ec_phone
      t.string :ec_email
      t.string :dln

      t.timestamps
    end
  end
end
