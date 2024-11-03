class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.integer :player_one_id
      t.integer :player_two_id
      t.text :board_state

      t.timestamps
    end
    add_foreign_key :games, :users, column: :player_one_id
    add_foreign_key :games, :users, column: :player_two_id
  end
end
