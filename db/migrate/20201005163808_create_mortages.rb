class CreateMortages < ActiveRecord::Migration[6.0]
  def change
    create_table :mortages do |t|
      t.integer :duration
      t.float :interest
      t.float :ltv

      t.timestamps
    end
  end
end
