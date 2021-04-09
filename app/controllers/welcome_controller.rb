class WelcomeController < ApplicationController
  include ApplicationHelper

  def index
    @username = "testweinmans2"
    @password = "Summer123"
    
    @authentication_results = authentication(@username,@password)
  end
end
