class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :make, null: false, default: ''
      t.string :model, null: false, default: ''
      t.string :color, null: false, default: ''
      t.integer :year, null: false, default: Date.today.year
      t.float :price, null: false, default: 0.0
      t.float :mileage, null: false, default: 0.0
      t.boolean :running, default: true
      t.string :interior_color, null: false, default: ''
      t.string :vin, null: false, default: ''

      t.timestamps
    end
  end
end
