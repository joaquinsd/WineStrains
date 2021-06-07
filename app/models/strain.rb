class Strain < ApplicationRecord
  has_many :assemblies, dependent: :delete_all
  has_many :wines, through: :assemblies, dependent: :delete_all

  def to_s
    name
  end
end
