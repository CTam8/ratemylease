class AddAttachmentImageToLeases < ActiveRecord::Migration
  def self.up
    change_table :leases do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :leases, :image
  end
end
