class LeaseTable < ActiveRecord::Migration[5.0]
  def change

    drop_table :leases

    create_table :leases do |t|
      t.string  :address
      t.string  :province
      t.string  :city
      t.string  :university
      t.integer :streetnumber
      t.string  :street
      t.string  :postalcode
      t.integer :numberofbathrooms
      t.integer :numberofbedrooms
      t.integer :numberofparkingspots
      t.timestamps null: false
    end

    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
      t.integer :cost
    end

  end
end
