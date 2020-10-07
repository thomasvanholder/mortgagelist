class CreateMortgages < ActiveRecord::Migration[6.0]
  def change
    create_table :mortgages do |t|
      t.integer :duration
      t.float :interest
      t.float :ltv
      t.references :lender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
