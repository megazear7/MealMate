class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :title
      t.text :description
      t.integer :calories
      t.integer :protien
      t.integer :fat
      t.integer :transfat
      t.integer :monofat
      t.integer :polyfat
      t.integer :carbs
      t.integer :suger
      t.integer :fiber
      t.integer :food_id
    end
  end
end
