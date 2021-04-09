class WelcomeController < ApplicationController
  include ApplicationHelper
  before_action :reset_session 

  def index
  end

  def create
     @authentication_results = authentication(params[:username],params[:password])
     submitted_survey_already = "false"
     if @authentication_results
	session[:username] = @username
	session[:first_name] = @first_name
	session[:last_name] = @last_name
	if Survey.find_by("user_id like ?", session[:username])
	  redirect_to surveys_path
	else
	  redirect_to new_survey_path
        end
     else
	redirect_to({ action: 'index' }, alert: "Bad Username, Password, or Not Authorized!")
     end 
end

  private
    def welcome_params
      params.permit(:username, :password)
    end
end
