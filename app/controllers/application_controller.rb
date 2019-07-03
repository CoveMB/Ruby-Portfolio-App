class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :set_source

  def set_source
    session[:source] = params[:utm_source] if params[:utm_source]
  end
end
