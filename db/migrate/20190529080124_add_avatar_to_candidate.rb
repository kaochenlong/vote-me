class AddAvatarToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :avatar, :string
  end
end
