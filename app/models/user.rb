class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
      # new_user.screen_name              = auth_info.extra.raw_info.screen_name
      # new_user.image                    = auth_info.info.image
      # new_user.description              = auth_info.info.description
      # new_user.followers_count          = auth_info.extra.raw_info.followers_count
      # new_user.friends_count            = auth_info.extra.raw_info.friends_count
    end
  end
end
