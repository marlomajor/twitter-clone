class TweetsController < ApplicationController

  def create
    @tweet_message = api_data(current_user).client.update(params[:tweet][:message])
    redirect_to root_path
  end

  def update
    api_data(current_user).client.favorite(params[:id].to_i)
    redirect_to root_path
  end
end
