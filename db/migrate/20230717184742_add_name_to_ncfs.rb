class AddNameToNcfs < ActiveRecord::Migration[7.0]
  def change
    add_column :ncfs, :name, :string
  end
end
