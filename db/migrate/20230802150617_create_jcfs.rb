class CreateJcfs < ActiveRecord::Migration[7.0]
  def change
    create_table :jcfs do |t|

      t.timestamps
    end
  end
end
