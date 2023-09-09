class AddTrcandtrialToLawsuit < ActiveRecord::Migration[7.0]
  def change
      add_column :lawsuits, :trc, :date
      add_column :lawsuits, :trial, :date
      add_column :lawsuits, :discovery_cutoff, :date 
      add_column :lawsuits, :first_expert_exchange, :date 
      add_column :lawsuits, :second_expert_exchange, :date
  end
end
