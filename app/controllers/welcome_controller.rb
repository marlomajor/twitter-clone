class WelcomeController < ApplicationController
  def index
    if current_user
      @tweets = current_user.tweets
      @auth_info
    end
  end
end
