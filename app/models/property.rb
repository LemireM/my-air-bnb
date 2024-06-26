class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10}
end
