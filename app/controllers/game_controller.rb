class GameController < ApplicationController
 # before_action :set_fight, only: %i[ show edit update archive destroy ]

  # GET /game
  def index
    @fight = Fight.last
  end

  # POST /next
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

end
