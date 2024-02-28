class CharactersController < ApplicationController
  before_action :set_character, only: %i[ edit update destroy ]
  before_action :set_layout_variables, only: %i[ index edit]
  layout "characters"

  # GET /characters
  def index
    @character = Character.new
  end

  # POST /character
  def create
    respond_to do |format|
      @character = Character.new(character_params)
      if @character.save
        format.html { redirect_back_or_to characters_path }
      else
        # TODO Check how to avoid these two duplicate from index...
        @characters = Character.order(:name).group_by(&:character_type)
        @fight = Fight.last
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # GET /character/1/edit
  def edit
  end

  # PATCH/PUT /character/1
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_back_or_to characters_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character.destroy!

    respond_to do |format|
      format.html { redirect_back_or_to :index }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    def set_layout_variables
      @characters = Character.order(:name).group_by(&:character_type)
      @fight = Fight.last
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit('name', 'details', 'pv', 'ac', 'url', 'character_type', 'countable')
    end
end