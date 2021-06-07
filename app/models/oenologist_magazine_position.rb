class OenologistMagazinePosition < ApplicationRecord
  belongs_to :oenologist
  belongs_to :magazine
  belongs_to :position
end
