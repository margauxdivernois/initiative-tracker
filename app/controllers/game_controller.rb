class GameController < ApplicationController
 # before_action :set_fight, only: %i[ show edit update archive destroy ]

  # GET /game
  def index
    # TODO
    @fight = Fight.last
  end

  # POST /game/next
  def next
    @fight = Fight.last
    if @fight.present?
      @index = @fight.current_player ? @fight.character_fights.index(@fight.current_player) + 1 : 0

      # Manage Turn Count
      if @index >= @fight.character_fights.count
        @index = @index % @fight.character_fights.count
        @fight.turn_count += 1
      end

      @fight.current_player = @fight.character_fights[@index]
      @fight.save
    end

    respond_to do |format|
      format.html { redirect_back_or_to index }
    end
  end

  def add_to_fight
    count = add_character_to_fight_params[:count].to_i
    character = Character.find(add_character_to_fight_params[:character])

    @fight = Fight.last
    if @fight.present?
      current_characters = CharacterFight.where(character: character, fight: @fight)
      delta = current_characters.count - count

      if delta < 0
        # Create delta elements
        for i in delta..-1 do
          CharacterFight.create(character: character, fight: @fight, initiative: 1, pv: character.pv)
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
        if characters_to_remove.include?(@fight.current_player)
          @fight.current_player = nil
          @fight.save!
        end

        characters_to_remove.destroy_all
      end
    else
      # TODO Error
    end

    respond_to do |format|
      format.html { redirect_back_or_to characters_path }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def add_character_to_fight_params
      params.require(:character).permit(:character, :count)
    end
end
