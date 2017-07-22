class AddBrandandSporttoSneakers < ActiveRecord::Migration[5.1]
  def change
    add_reference :sneakers, :brand, index: true, foreign_key: true
    add_reference :sneakers, :sport, index: true, foreign_key: true
  end
end
