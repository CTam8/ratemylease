class CreateLeases < ActiveRecord::Migration[5.0]
  def change
    create_table :leases do |t|
      t.string  :province
      t.string  :city
      t.string  :university
      t.integer :streetnumber
      t.string  :street
      t.integer :cost
      t.string  :postalcode
      t.integer :numberofbathrooms
      t.integer :numberofbedrooms
      t.integer :numberofparkingspots
      t.timestamps null: false
    end
  end
end
