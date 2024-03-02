class AuthorityController < ApplicationController
  skip_before_action :authenticate
  add_flash_types :success #TODO Test if needed

  # GET /login
  def login
  end

  # POST /login_parse
  def login_parse
    respond_to do |format|
      # Check the token
      if code_params === Rails.application.config.token
        session[:authenticated] = true
        format.html { redirect_to game_index_path, flash: {success: 'Bienvenue!'} }
      else
        format.html { redirect_to :login, flash: {danger: 'Mot de passe incorrect'} }
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
