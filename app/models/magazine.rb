class Magazine < ApplicationRecord

  has_many :oenologist_magazine_positions, dependent: :delete_all
  has_many :positions, through: :oenologist_magazine_positions, dependent: :delete_all
  has_many :oenologists, through: :oenologist_magazine_positions, dependent: :delete_all

  def to_s
    name
  end
end
