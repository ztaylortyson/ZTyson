class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :attorneys
    drop_table :participants
    drop_table :attorney_lawsuits
    drop_table :attorney_participants
    drop_table :lawsuit_participants

  end
end
