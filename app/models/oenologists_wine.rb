class OenologistsWine < ApplicationRecord
  belongs_to :oenologist
  belongs_to :wine

  def oenologist_name
    Oenologist.find(oenologist_id).name
  end

  def wine_name
    Wine.find(wine_id).name
  end

end
