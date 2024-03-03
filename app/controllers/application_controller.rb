class ApplicationController < ActionController::Base
  before_action :authenticate, :set_show_tabs, :set_is_gm

  private
    def authenticate
        redirect_to login_path, flash: { danger: t('alerts.forbidden') } if session[:authenticated].nil?
    end

    # Display the Header&Tabulations in the layout
    # True by default
    def set_show_tabs
        @show_tabs = true
    end

    def set_is_gm
        @is_gm = session[:authenticated]
    end
end
