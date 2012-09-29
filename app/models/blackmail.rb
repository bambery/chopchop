class Blackmail < ActiveRecord::Base
  validates :hustler_id, :victim_id, :video_url
  validate :hustler_is_not_victim

  belongs_to  :hustler,
              :foreign_key => :hustler_id,
              :class_name => 'User'
  belongs_to  :victim, 
              :foreign_key => :victim_id,
              :class_name => 'User'
  attr_accessible :deadline, :note, :video_url

  def huslter_is_not_victim
    if hustler.email == victim.email
      errors.add(:victim_id, "You can't blackmail yourself.")
    end
  end
end
