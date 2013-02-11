
#
# This model represent a comment which is modelized by a body, and a commentator. It belongs to a user
#
#
#
class Comment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :commenter
end
