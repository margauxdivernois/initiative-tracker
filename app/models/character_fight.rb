class CharacterFight < ApplicationRecord
  belongs_to :character
  belongs_to :fight

  validates :initiative, numericality: { only_integer: true }

  class << self
    def align_with_count(character, count, fight)
      current_characters = CharacterFight.where(character: character, fight: fight)
      delta = current_characters.count - count

      if delta < 0
        # Create delta elements
        for i in delta..-1 do
          CharacterFight.create(character: character, fight: fight, initiative: 1, pv: character.pv)
        end

      elsif delta > 0
        # This update should not happen "during" a fight as the deletion of players
        # can be done from the Game page directly in case of "death".
        # This assumption apply a few development choices here.

        # Select "randomly" the characters to delete
        characters_to_remove = current_characters.limit(delta)

        # Set manually to null the current player if it's within the deleted players
        # Improvement could be the usage of dependent: :nullify on the relation `belongs_to` but :
        # The :dependent option must be one of [:destroy, :delete, :destroy_async], but is :nullify
        if characters_to_remove.include?(fight.current_player)
          fight.current_player = nil
          fight.save!
        end

        characters_to_remove.destroy_all
      end
    end
  end
end
