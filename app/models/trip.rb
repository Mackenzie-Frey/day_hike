class Trip < ApplicationRecord

  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def total_length
    trails.sum(:length)
  end

  def average_length
    trails.average(:length)
  end

  def longest_trail
    trails.order("length DESC").first
  end

  def shortest_trail
    trails.order("length ASC").first
  end
end
