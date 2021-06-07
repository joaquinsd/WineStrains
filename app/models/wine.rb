class Wine < ApplicationRecord
  has_many :assemblies, dependent: :delete_all
  has_many :strains, through: :assemblies, dependent: :delete_all
  accepts_nested_attributes_for :assemblies

  has_many :oenologists_wines, dependent: :delete_all
  has_many :oenologists, through: :oenologists_wines, dependent: :delete_all
  accepts_nested_attributes_for :oenologists_wines

  def order_strains
    strains = []
    self.assembly_ids.each do |assembly_id|
      strains.append(Strain.find(Assembly.find(assembly_id).strain_id).to_s+' ['+Assembly.find(assembly_id).percentage.to_s+'%]')
    end

    strains = strains.sort
  end

  def oenologist_name(oenologist_id)
    Oenologist.find(oenologist_id).name
  end


end
