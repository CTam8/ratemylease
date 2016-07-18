class CreateLeases < ActiveRecord::Migration[5.0]
  def change
    create_table :leases do |t|

      t.timestamps
    end
  end
end
