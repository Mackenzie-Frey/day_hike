class Trip < ApplicationRecord

  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def total_length
    trails.sum(:length)
  end

  def average_length
    trails.average(:length)
  end
end
