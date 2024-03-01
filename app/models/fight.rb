class Fight < ApplicationRecord
    has_many :character_fights, -> { order initiative: :desc }
    belongs_to :current_player, class_name: "CharacterFight", optional: true

    def character_count_in_fight(character)
        character_fights.where(character: character).count
    end
end
