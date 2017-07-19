class CreateSneakers < ActiveRecord::Migration[5.1]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.decimal :price
      t.string :footlocker_url

      t.timestamps
    end
  end
end
