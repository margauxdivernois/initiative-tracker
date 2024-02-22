class Fight < ApplicationRecord
    has_many :character_fights, -> { order initiative: :desc }
    belongs_to :current_player, class_name: "CharacterFight"
end
