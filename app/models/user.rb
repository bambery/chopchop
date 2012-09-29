class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :email, :facebook_id, :name

  def self.find_for_facebook(facebook_self)
    facebook_data = facebook_self[0]["data"]
    user = User.where(:facebook_id => facebook_data["id"]).first
      unless user
        user = User.create(
          :name        => facebook_data["name"],
          :email       => facebook_data["email"],
          :facebook_id => facebook_data["id"]
        )
      end
    user
  end
end
