class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :candidate, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
