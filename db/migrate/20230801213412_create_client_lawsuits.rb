2class CreateClientLawsuits < ActiveRecord::Migration[7.0]
  def change
    create_table :client_lawsuits do |t|
      t.references :Client, null: false, foreign_key: true
      t.references :Lawsuit, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
