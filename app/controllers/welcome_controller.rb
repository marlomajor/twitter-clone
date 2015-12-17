class WelcomeController < ApplicationController
  def index
    if current_user
      @twitter_info = api_data(current_user)
      @user = current_user
    end
  end
end
