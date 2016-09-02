class ChangeTypeOfUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :type, :typeofuser
  end
end
