class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :student

  validates :behavior, presence: true
  validates :letter_grade, presence: true
end
