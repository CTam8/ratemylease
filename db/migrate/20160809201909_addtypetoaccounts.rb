class Addtypetoaccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type, :string
    add_column :users, :contact_email, :string
    add_column :users, :contact_phone, :string
  end
end
