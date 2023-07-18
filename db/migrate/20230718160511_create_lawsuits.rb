class CreateLawsuits < ActiveRecord::Migration[7.0]
  def change
    create_table :lawsuits do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :active
      t.string :case_number
      t.string :case_title
      t.date :date_filed
      t.date :cmc
      t.string :judge_name
      t.string :judge_dept
      t.string :case_status
      t.string :last_roa
      t.string :plt_caption
      t.string :def_caption

      t.timestamps
    end
  end
end
