class Wine < ApplicationRecord
  has_many :assemblies, dependent: :destroy
  has_many :strains, through: :assemblies, dependent: :destroy
  accepts_nested_attributes_for :assemblies

  def order_strains
    strains = []
    self.assembly_ids.each do |assembly_id|
      strains.append(Strain.find(Assembly.find(assembly_id).strain_id).to_s+' ['+Assembly.find(assembly_id).percentage.to_s+'%]')
    end

    strains = strains.sort
  end

end
