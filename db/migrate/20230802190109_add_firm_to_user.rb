class AddFirmToUser < ActiveRecord::Migration[7.0]
  def change
      add_column :users, :firm, :string
  end
end
