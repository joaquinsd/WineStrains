class Oenologist < ApplicationRecord
  has_many :oenologists_wines, dependent: :delete_all
  has_many :wines, through: :oenologists_wines, dependent: :delete_all

  has_many :oenologist_magazine_positions, dependent: :delete_all
  has_many :positions, through: :oenologist_magazine_positions, dependent: :delete_all
  has_many :magazines, through: :oenologist_magazine_positions, dependent: :delete_all

  accepts_nested_attributes_for :oenologist_magazine_positions

  default_scope { order(age: :desc) }

  def magazine_names
    magazines.map(&:name)
  end

  def order_magazines
    magazines = []
    self.oenologist_magazine_position_ids.each do |omp_id|
      magazines.append(
        Magazine.find(OenologistMagazinePosition.find(omp_id).magazine_id).to_s+' ['+
        Position.find(OenologistMagazinePosition.find(omp_id).position_id).to_s+']')
    end

    magazines = magazines.sort
  end


end
