class Comment < ActiveRecord::Base
  belongs_to :user
  delegate : self , :to => user.address

  def commenter_address
    "#{self.city},#{self.country}"
  end

  def self.recent(count)
    orderby("created_at DESC").limit(count)
  end

  def is_minimum_length?
    self.text.length > 4
  end
end

