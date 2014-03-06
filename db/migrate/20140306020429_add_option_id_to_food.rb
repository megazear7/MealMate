class AddOptionIdToFood < ActiveRecord::Migration
  def change
    add_column :foods, :option_id, :integer
    remove_column :foods, :food_id, :integer
  end
end
