class Student < ActiveRecord::Base
  has_many :grades
  has_many :teachers, through: :grades
  belongs_to :course
end
