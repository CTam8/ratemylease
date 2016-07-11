class Lease < ActiveRecord::Base
  validates :province             , presence:true, length: { maximum: 25 }
  validates :city                 , presence:true, length: { maximum: 25 }
  validates :university           , presence:true, length: { maximum: 25 }
  validates :streetnumber         , presence:true, numericality: { only_integer: true }
  validates :street               , presence:true, length: { maximum: 25 }
  validates :cost                 , presence:true,  numericality: {only_integer: true }
  Canadian_Postal_Code = /[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}/
  validates :postalcode           , presence:true, length: { maximum: 6 },
                                    format:  { with: Canadian_Postal_Code}
  validates :numberofbathrooms    , presence:true,  numericality: {only_integer: true }
  validates :numberofbedrooms     , presence:true,  numericality: {only_integer: true }
  validates :numberofparkingspots , presence:true,  numericality: {only_integer: true }
end
