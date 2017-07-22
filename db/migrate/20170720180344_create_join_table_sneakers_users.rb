class CreateJoinTableSneakersUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :sneakers, :users do |t|
      t.index [:sneaker_id, :user_id]
      t.index [:user_id, :sneaker_id]
    end
  end
end
