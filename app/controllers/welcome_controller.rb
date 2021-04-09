class WelcomeController < ApplicationController
  include ApplicationHelper

  skip_before_action :verify_authenticity_token

  def index
  end

  def create
     @authentication_results = authentication(params[:username],params[:password])
     submitted_survey_already = 
     if @authentication_results
	
	redirect_to new_survey_path
     else
	redirect_to({ action: 'index' }, alert: "Bad Username, Password, or Not Authorized!")
     end 
end

  private
    def welcome_params
      params.permit(:username, :password)
    end
end
