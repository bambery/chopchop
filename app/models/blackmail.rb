class Blackmail < ActiveRecord::Base
  validates :hustler_id, :victim_id, :amount,
            :presence => true
  validates :amount, :numericality =>{:less_than_or_equal_to => 15.00}

  #validate :hustler_is_not_victim

  belongs_to  :hustler,
              :foreign_key => :hustler_id,
              :class_name => 'User'
  belongs_to  :victim, 
              :foreign_key => :victim_id,
              :class_name => 'User'

  attr_accessible :deadline, :note, :video_url, :hustler_id, :victim_id, :amount

  def hustler_is_not_victim
    if hustler_id == victim_id
      errors.add(:victim_id, "You can't blackmail yourself.")
    end
  end

  def victim_name
    User.find(self.victim_id).name
  end

  def victim_email
    User.find(self.victim_id).email
  end

  def hustler_name
    User.find(self.hustler_id).name
  end

  def hustler
    User.find(self.hustler_id)
  end

  def victim
    User.find(self.victim_id)
  end

  def generate_venmo_link
    first ="https://venmo.com?txn=Charge&recipients="
    email_parts = hustler.email.split('@')
    second ="&amount=#{self.amount}&note=#{self.note}"
    return first+email_parts[0]+"%40"+email_parts[1]+second
  end

end
