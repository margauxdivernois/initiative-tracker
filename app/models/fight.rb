class Fight < ApplicationRecord
    has_many :character_fights
    belongs_to :current_player, class_name: "Character"
end
