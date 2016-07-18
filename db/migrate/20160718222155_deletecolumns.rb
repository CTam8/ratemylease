class Deletecolumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :leases, :streetnumber
    remove_column :leases, :street
  end
end
