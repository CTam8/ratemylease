class Removeleasecolumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :leases, :streetnumber
    remove_column :leases, :street
    remove_column :leases, :cost
    remove_column :leases, :numberofbathrooms
    remove_column :leases, :numberofbedrooms
    remove_column :leases, :numberofparkingspots
    add_column :leases, :address, :string
  end
end
