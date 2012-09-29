class WelcomeController < ApplicationController
  def index
    if access_token
      @profiles = HTTParty.get(facebook_self,
        :query => {
          :access_token => access_token
        }
      ).parsed_response
    end
  end

private

  def access_token
    session[:access_token]
  end

  SINGLY_API_BASE = "https://api.singly.com"

  def facebook_self
    "#{SINGLY_API_BASE}/v0/services/facebook/self"
  end

  def profiles_url
    "#{SINGLY_API_BASE}/profiles"
  end
end
