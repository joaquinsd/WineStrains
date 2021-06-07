module WinesHelper

  def list_grades(oenologist_id, wine_id)
    OenologistsWine.where(oenologist_id: oenologist_id, wine_id: wine_id)
  end


end
