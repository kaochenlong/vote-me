class AddVoteToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :vote, :integer, default: 0
  end
end
