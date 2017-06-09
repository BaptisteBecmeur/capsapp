class Prestation < ApplicationRecord
  belongs_to :user

  validates :talent, presence: true
  validates :showing_type, presence: true
  validates :name_scene, presence: true
  validates :listing_name, presence: true, length: {maximum: 75}
  validates :summary, presence: true, length: {maximum: 600}
  validates :address, presence: true
  validates :price, numericality: {only_integer: true, greater_than: 5}
end
