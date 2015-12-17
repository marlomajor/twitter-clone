require "test_helper"

class TwitterServiceTest < ActiveSupport::TestCase
  def create_user_marlo
    User.create( { name: "Marlo M. Major",
                   screen_name: "marlomajor",
                   uid: ENV["marlo_uid"],
                   oauth_token: ENV["marlo_access_token"],
                   oauth_token_secret: ENV["marlo_access_token_secret"] } )
  end

  test "complete user info" do
    VCR.use_cassette("twitter_service#complete_user_info") do
      user = create_user_marlo
      service = TwitterService.new(user)

      assert_equal "Marlo M. Major", service.client.user.name
      assert_equal "marlomajor", service.client.user.screen_name
      assert_equal 79853872, service.client.user.id

    end
  end

  test "available tweet feed" do
    VCR.use_cassette("twitter_service#tweet_feed_info") do
      user = create_user_marlo
      service = TwitterService.new(user)

      assert_equal "Word of advice. DO NOT SWITCH TO ANOTHER FRONT END FRAMEWORK HOURS BEFORE THE SOFTWARE IS DUE", service.client.user_timeline.first.text
      assert_equal true, service.client.user_timeline.first.favorited?
    end
  end

  test "follower and following count" do
    VCR.use_cassette("twitter_service#follow_info") do
      user = create_user_marlo
      service = TwitterService.new(user)

      assert_equal 33, service.client.user.followers_count
      assert_equal 49, service.client.user.friends_count
      end
    end
end
