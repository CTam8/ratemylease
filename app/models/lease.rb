class Lease < ApplicationRecord
  attr_accessor :image

  searchkick
  has_many :reviews

  validates_presence_of :address, :message => "Address can't be blank"
  validates_presence_of :city, :message => "City can't be blank"
  validates_presence_of :province, :message => "Province can't be blank"
  validates_presence_of :university, :message => "University can't be blank"
  validates_presence_of :numberofbedrooms, :message => "Number of Bedrooms can't be blank"
  validates_presence_of :numberofbathrooms, :message => "Number of Bathrooms can't be blank"

  PROVINCE = [
    ["Alberta"],
    ["British Columbia"],
    ["Manitoba"],
    ["New Brunswick"],
    ["Newfoundland and Labrador"],
    ["Nova Scotia"],
    ["Ontario"],
    ["Prince Edward Island"],
    ["Quebec"],
    ["Saskatchewan"]
  ]

  # has_attached_file :image, styles: { medium: "400x600#>"}
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  mount_uploader :image, ImageUploader

  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?
  scope :leases,               -> { where.not(:latitude => nil) }
  scope :leases,               -> { where.not(:longitude => nil) }

  def full_address
    [address,city,province,postalcode].join(', ')
  end

end
