class CreateAttorneyLawsuits < ActiveRecord::Migration[7.0]
  def change
    create_table :attorney_lawsuits do |t|
      t.references :Attorney, null: false, foreign_key: true
      t.references :Lawsuit, null: false, foreign_key: true
      t.string :role
      t.string :clt

      t.timestamps
    end
  end
end
