class WelcomeController < ApplicationController
  def index
    if current_user.present?
      @service = TwitterService.new(current_user)
    end
  end
end
