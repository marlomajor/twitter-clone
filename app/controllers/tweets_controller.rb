class TweetsController < ApplicationController

  def complete_info
    @tweet_info = Tweet.complete_info(params[:id])
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
  end

  def create
    @tweet = Tweet.create(params[:tweet])
    redirect_to tweet_path(@tweet.id)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.update(params[:id], params[:tweet])

    redirect_to tweet_path(@tweet.id)
  end

  def destroy
    Tweet.destroy(params[:id])

    redirect_to tweets_path
  end

end
