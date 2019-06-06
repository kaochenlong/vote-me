class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :recipient
      t.string :phone
      t.string :address
      t.text :note
      t.string :state
      t.datetime :deleted_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
