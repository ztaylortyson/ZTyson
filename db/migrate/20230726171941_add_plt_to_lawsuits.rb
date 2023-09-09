class AddPltToLawsuits < ActiveRecord::Migration[7.0]
  def change
      add_column :lawsuits, :plaintiff, :string
      add_column :lawsuits, :atty_for, :string
      add_column :lawsuits, :defendant, :string
  end
end
