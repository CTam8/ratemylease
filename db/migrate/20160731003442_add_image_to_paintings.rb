class AddImageToPaintings < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :image, :string
  end
end
