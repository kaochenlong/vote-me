class AddDefaultToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :state, 'pending'
  end
end
