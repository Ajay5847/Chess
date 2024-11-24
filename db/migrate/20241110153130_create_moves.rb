class CreateMoves < ActiveRecord::Migration[7.2]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :piece_type
      t.string :start_position
      t.string :end_position
      t.integer :move_number

      t.timestamps
    end
  end
end
