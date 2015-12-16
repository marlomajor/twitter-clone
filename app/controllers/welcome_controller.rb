require

class WelcomeController < ApplicationController
  def index
    if current_user.present?
      binding.pry
      @service = TwitterService.new(current_user)
    end
  end
end
