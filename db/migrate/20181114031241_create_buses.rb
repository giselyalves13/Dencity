class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :prefix
      t.string :line
      t.string :load
      t.string :arrival_time
      t.float :py
      t.float :px

      t.timestamps
    end
  end
end
