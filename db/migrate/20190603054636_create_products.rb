class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.boolean :is_available

      t.timestamps
    end
  end
end
