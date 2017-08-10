class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :prestation

  has_one :payment
  accepts_nested_attributes_for :payment

end
