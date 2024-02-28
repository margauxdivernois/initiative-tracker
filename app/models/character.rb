class Character < ApplicationRecord
    has_many :character_fights

    enum character_type: {
        Character: 0,
        Monster: 1,
        Temporary: 2
      }
end
