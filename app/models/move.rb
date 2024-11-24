class Move < ApplicationRecord
  belongs_to :game
  belongs_to :player, class_name: User.name, foreign_key: "user_id"
end
