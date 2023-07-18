class CreateNcfs < ActiveRecord::Migration[7.0]
  def change
    create_table :ncfs do |t|

      t.timestamps
    end
  end
end
