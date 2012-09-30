class User < ActiveRecord::Base
  devise :omniauthable
  validates :name, :email,
            :presence => true

  has_many  :outgoing_blackmails,
            :foreign_key => :hustler_id,
            :class_name => 'Blackmail'

  has_many  :incoming_blackmails,
            :foreign_key => :victim_id,
            :class_name => "Blackmail"


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

  def is_blackmailing?
    Blackmail.find_by_hustler_id(self.id)
  end
end
