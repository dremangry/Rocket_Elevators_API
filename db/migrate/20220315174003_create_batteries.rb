class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: true
      t.string :type
      t.string :status
      t.references :employee, foreign_key: true
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.binary :certificate_of_operations
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
