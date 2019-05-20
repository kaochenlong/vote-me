class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :age
      t.string :party
      t.text :platform

      t.timestamps
    end
  end
end
