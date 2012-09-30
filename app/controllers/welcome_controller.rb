class WelcomeController < ApplicationController
  def index
    if access_token
      @facebook_self = HTTParty.get(facebook_self,
        :query => {
          :access_token => access_token
        }
      ).parsed_response

      @current_user = User.find_for_facebook(@facebook_self)
      redirect_to user_path(@current_user) 
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
