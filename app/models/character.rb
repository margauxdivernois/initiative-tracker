class Character < ApplicationRecord
    has_many :character_fights, dependent: :destroy

    validates :name, uniqueness: true, presence: true
    validates :details, presence: true
    validates :pv, :ac, presence: true, numericality: { only_integer: true }

    #enum :character_type, [ :character, :monster, :temporary ]
    enum character_type: {
        Character: 0,
        Monster: 1,
        Temporary: 2
      }
end
