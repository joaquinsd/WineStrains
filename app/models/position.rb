class Position < ApplicationRecord
  has_many :oenologist_magazine_positions, dependent: :delete_all
  has_many :magazines, through: :oenologist_magazine_positions, dependent: :delete_all
  has_many :oenologists, through: :oenologist_magazine_positions, dependent: :delete_all

  def to_s
    name
  end
end
