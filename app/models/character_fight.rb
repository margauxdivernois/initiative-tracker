class CharacterFight < ApplicationRecord
  belongs_to :character
  belongs_to :fight

  validates :initiative, numericality: { only_integer: true }
end
