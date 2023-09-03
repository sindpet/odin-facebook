class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :friender, null: false, foreign_key: { to_table: :users }
      t.references :friendee, null: false, foreign_key: { to_table: :users }
      t.boolean :status

      t.timestamps
    end
  end
end
