class CreateAttorneys < ActiveRecord::Migration[7.0]
  def change
    create_table :attorneys do |t|
      t.string :sbn
      t.string :status
      t.string :name
      t.string :firm
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
