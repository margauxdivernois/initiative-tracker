class Character < ApplicationRecord
    has_many :character_fights, dependent: :destroy
    has_one_attached :image

    validates :name, uniqueness: true, presence: true
    validates :details, presence: true
    validates :pv, :ac, presence: true, numericality: { only_integer: true }

    enum :character_type, [ :character, :monster, :temporary ]

    class << self
      def grouped_by_type
        characters = {}
        Character.character_types.each do | type, value |
          characters[type] = Character.where(character_type: value).order(:name)
        end
        characters
      end
    end
end
