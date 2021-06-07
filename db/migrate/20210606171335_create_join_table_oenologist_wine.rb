class CreateJoinTableOenologistWine < ActiveRecord::Migration[6.0]
  def change
    create_join_table :oenologists, :wines, column_options: { null: false, foreign_key: true } do |t|
      t.index [:oenologist_id, :wine_id]
      t.index [:wine_id, :oenologist_id]
    end
  end
end
