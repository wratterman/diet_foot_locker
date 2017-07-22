class CreatJoinTableBrandsSports < ActiveRecord::Migration[5.1]
  def change
    create_join_table :brands, :sports do |t|
      t.index [:brand_id, :sport_id]
      t.index [:sport_id, :brand_id]
    end
  end
end
