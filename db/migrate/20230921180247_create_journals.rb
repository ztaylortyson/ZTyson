class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.date :event_date
      t.text :description
      t.string :binder
      t.string :note
      t.decimal :cost, precision: 8, scale: 2
      t.references :Lawsuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
