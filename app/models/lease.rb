class Lease < ApplicationRecord

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

  has_attached_file :image, styles: { medium: "400x600#>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address,city,province,postalcode].join(', ')
  end

end
