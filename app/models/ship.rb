class Ship < ActiveRecord::Base
  belongs_to :character1
  belongs_to :character2
  has_many :comments

  def comment_list
    self.comments
  end

end