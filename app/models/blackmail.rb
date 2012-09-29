class Blackmail < ActiveRecord::Base
  belongs_to :sender
  belongs_to :recipient
  attr_accessible :deadline, :note, :video_url
end
