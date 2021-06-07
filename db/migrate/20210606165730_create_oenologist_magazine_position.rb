class CreateOenologistMagazinePosition < ActiveRecord::Migration[6.0]
  def change
    create_table :oenologist_magazine_positions do |t|
      t.references :oenologist, null: false, foreign_key: true
      t.references :magazine, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
    end
  end
end
