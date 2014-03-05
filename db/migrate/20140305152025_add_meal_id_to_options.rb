class AddMealIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :meal_id, :integer
  end
end
