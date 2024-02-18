class GameController < ApplicationController
 # before_action :set_fight, only: %i[ show edit update archive destroy ]

  # GET /game
  def index
    @fight = Fight.last
    @characters = @fight.character_fights
    @current = @characters.first
  end

end
