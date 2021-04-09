class WelcomeController < ApplicationController
  include ApplicationHelper


  def index
  end

  def create
     @authentication_results = authentication(params[:username],params[:password])
     submitted_survey_already = "false"
     if @authentication_results
	session[:username] = @username
	session[:first_name] = @first_name
	session[:last_name] = @last_name
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
