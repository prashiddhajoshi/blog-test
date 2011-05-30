class Post < ActiveRecord::Base
has_many :comments
belongs_to :user

def recent_commenters
    self.comments.recent(5).collect{|comment| comment.user.login}.commenter.join("")
 end


end

