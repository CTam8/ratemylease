class Lease < ApplicationRecord

  has_many :reviews

  validates_presence_of :address
  validates_presence_of :province
  validates_presence_of :city
  validates_presence_of :university
  validates_presence_of :numberofbedrooms
  validates_presence_of :numberofparkingspots
  validates_presence_of :numberofbathrooms

  # validates :province             , presence:true, length: { maximum: 25 }
  # validates :city                 , presence:true, length: { maximum: 25 }
  # validates :university           , presence:true, length: { maximum: 25 }
  # Canadian_Postal_Code = /[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}/
  # validates :postalcode           , presence:true, length: { maximum: 6 },
  #                         format:  { with: Canadian_Postal_Code}
  # validates :numberofbathrooms    , presence:true,  numericality: {only_integer: true }
  # validates :numberofbedrooms     , presence:true,  numericality: {only_integer: true }
  # validates :numberofparkingspots , presence:true,  numericality: {only_integer: true }


  PROVINCE = [
    ['Alberta'],
    ['British Columbia'],
    ['Manitoba'],
    ['New Brunswick'],
    ['Newfoundland and Labrador'],
    ['Nova Scotia'],
    ['Ontario'],
    ['Prince Edward Island'],
    ['Quebec'],
    ['Saskatchewan']
  ]
end
