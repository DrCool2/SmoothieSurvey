class WelcomeController < ApplicationController
  include ApplicationHelper

  def index
    @username = "testweinmans"
    @password = "Summer123"
    
    authentication(@username,@password)
  end
end
