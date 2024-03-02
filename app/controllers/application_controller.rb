class ApplicationController < ActionController::Base
    before_action :authenticate

    private

        def authenticate
            redirect_to login_path, flash: {danger: 'You must be signed in'} if session[:authenticated].nil?
        end
end
