class RemoveOptionIdFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :option_id, :integer
  end
end
