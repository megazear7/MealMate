class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.text :description
      t.integer :option_id
    end
  end
end
