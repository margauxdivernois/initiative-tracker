class CharactersController < ApplicationController
  before_action :set_character, only: %i[ edit update ]

  # GET /characters
  def index
    @characters = Character.order(:name).group_by(&:character_type)
    @fight = Fight.last
  end

  # POST /character
  def create
    respond_to do |format|
      # TODO Validation
      localParams = character_params
      localParams[:character_type] = character_params[:character_type].to_i
      logger.info(localParams)
      if Character.create(localParams)
        format.html { redirect_back_or_to characters_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # GET /character/1/edit
  def edit
  end

  # PATCH/PUT /character/1y
  def update
    respond_to do |format|
      if @character_fight.update(character_fight_params)
        format.html { redirect_back_or_to index }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit('name', 'details', 'pv', 'ac', 'url', 'character_type', 'countable')
    end
end