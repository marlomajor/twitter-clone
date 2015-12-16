class TwitterService
  attr_reader :client

  def initialize(current_user)
   @client = Twitter::REST::Client.new do |config|
     config.consumer_key        = "YOUR_CONSUMER_KEY"
     config.consumer_secret     = "YOUR_CONSUMER_SECRET"
     config.access_token        = current_user[:oauth_token]
     config.access_token_secret = current_user[:oauth_token_secret]
   end
  end

  def complete_info(id)
   @tweet_info = parse(connection.get("complete_info/#{id}"))
 end

 def tweets
   parse(connection.get('tweets'))
 end

 def tweet(id)
   parse(connection.get("tweets/#{id}"))
 end

 def create_tweet
   parse(connection.post('tweets', params))
 end

 def update_tweet(id, params)
   parse(connection.patch("tweets/#{id}", params))
 end

 def delete_tweet(id)
   parse(connection.delete("tweets/#{id}"))
 end

 private

 def parse(response)
   JSON.parse(response.body, symbolize_names: true)
 end

end
