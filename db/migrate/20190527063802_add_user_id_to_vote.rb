class AddUserIdToVote < ActiveRecord::Migration[5.2]
  def change
    # add_column :votes, :user_id, :integer
    add_reference :votes, :user, index: true
  end
end
