class Student < ActiveRecord::Base
  has_many :grades
  has_many :users, through: :grades

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.smartest_students
    Grade.order(:score) 
  end
end
