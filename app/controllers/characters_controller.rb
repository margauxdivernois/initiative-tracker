class CharactersController < ApplicationController
  before_action :set_character, only: %i[ edit update destroy ]

  # GET /characters
  def index
    @characters = Character.grouped_by_type
  end

  # GET /characters/new
  # Included with Turbo
  def new
    @character = Character.new
  end

  # POST /character
  def create
    respond_to do |format|
      @character = Character.new(character_params)
      if @character.save
        format.html { redirect_back_or_to characters_path }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /character/:id/edit
  def edit
  end

  # PATCH/PUT /character/:id
  # Included with Turbo
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_back_or_to characters_path }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_back_or_to :index }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit('name', 'details', 'pv', 'ac', 'url', 'character_type', 'countable', 'image')
    end
end