class User < ApplicationRecord
  has_many: properties, dependent: :destroy
  has_many: bookings, dependent: :destroy
  has_many: reviews, dependent: :destroy
end
