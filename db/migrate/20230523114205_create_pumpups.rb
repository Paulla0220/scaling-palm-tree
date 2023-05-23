class CreatePumpups < ActiveRecord::Migration[7.0]
  def change
    create_table :pumpups do |t|
      t.integer :series
      t.integer :rep
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
