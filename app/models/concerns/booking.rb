class booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date && start_date && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
