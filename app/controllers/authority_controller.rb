class AuthorityController < ApplicationController
  skip_before_action :authenticate, :set_show_tabs

  # GET /login
  def login
    # Redirect to fights list if the user is connected
    if @is_gm
      respond_to do |format|
        format.html { redirect_to :fights }
      end
    end
  end

  # POST /login_parse
  def login_parse
    respond_to do |format|
      # Check the token
      if code_params === Rails.application.config.token
        session[:authenticated] = true
        format.html { redirect_to :fights, flash: { success: t('alerts.welcome') } }
      else
        format.html { redirect_to :login, flash: { danger: t('alerts.wrong_password') } }
      end
    end
  end

  def logout
    session.delete(:authenticated)
    respond_to do |format|
      format.html { redirect_to :login }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def code_params
      params.require(:code)
    end

end
