class AddAttrToLease < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :laundry, :boolean
    add_column :leases, :typeOfHouse, :string
    add_column :leases, :furnished, :boolean
  end
end
