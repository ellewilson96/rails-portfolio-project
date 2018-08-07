class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :student

  validates :behavior, presence: true
  validates :score, presence: true

  def self.teacher?
    if self.user == current_user
      true
    else
      false
    end
end

end
