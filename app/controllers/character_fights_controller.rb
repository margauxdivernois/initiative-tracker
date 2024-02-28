class CharacterFightsController < ApplicationController
  before_action :set_character_fight, only: %i[ edit update edit_initiative edit_pv destroy ]

  # GET /character_fights/1/edit
  def edit
  end

  # PATCH/PUT /character_fights/1 or /character_fights/1.json
  def update
    respond_to do |format|
      if @character_fight.update(character_fight_params)
        format.html { redirect_back_or_to game_index_path }
        format.json { render :show, status: :ok, location: @character_fight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character_fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /character_fights/1/edit_initiative
  def edit_initiative
  end

  # GET /character_fights/1/edit_pv
  def edit_pv
  end

  def destroy
    @character_fight.destroy

    respond_to do |format|
      format.html { redirect_back_or_to :index }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_fight
      @character_fight = CharacterFight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_fight_params
      params.require(:character_fight).permit(:initiative, :pv)
    end
end