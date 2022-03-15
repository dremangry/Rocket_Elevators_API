class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.integer :num_apts
      t.integer :num_floors
      t.integer :num_base
      t.integer :num_comp
      t.integer :num_park
      t.integer :num_elev
      t.integer :num_corps
      t.integer :max_occ
      t.integer :b_hours
      t.string :product_line
      t.string :unit_price
      t.string :elev_cost
      t.string :install_fee
      t.string :total_cost

      t.timestamps
    end
  end
end
