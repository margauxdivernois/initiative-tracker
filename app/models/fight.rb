class Fight < ApplicationRecord
    has_many :character_fights, -> { order initiative: :desc }
    belongs_to :current_player, class_name: "CharacterFight", optional: true

    def character_count_in_fight(character)
        character_fights.where(character: character).count
    end

    def next
        @index = current_player ? character_fights.index(current_player) + 1 : 0

        # Manage Turn Count
        if @index >= character_fights.count
          @index = @index % character_fights.count
          turn_count += 1
        end

        self.current_player = character_fights[@index]
        save
    end
end
