class Lease < ActiveRecord::Base
  validates :province             , presence:true, length: { maximum: 25 }
  validates :city                 , presence:true, length: { maximum: 25 }
  validates :university           , presence:true, length: { maximum: 25 }
  validates :address               , presence:true, length: { maximum: 25 }
  Canadian_Postal_Code = /[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}/
  validates :postalcode           , presence:true, length: { maximum: 6 },
                                    format:  { with: Canadian_Postal_Code}
end
