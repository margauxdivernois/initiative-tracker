class FightsController < ApplicationController
  before_action :set_fight, only: %i[ show next ]
  skip_before_action :authenticate, only: %i[ show ]
  skip_before_action :set_show_tabs, only: %i[ show ]

  # GET /fight
  def index
    @fights = Fight.all
  end

  def show
  end

  # POST /fight/:id/next
  def next
    @fight.next

    respond_to do |format|
      format.html { redirect_back_or_to show }
    end
  end

  private
    def set_fight
      @fight = Fight.find(params[:id])
    end

end
