class AddLatLonToLease < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :latitude, :float
    add_column :leases, :longitude, :float
  end
end
