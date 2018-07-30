class Student < ActiveRecord::Base
  has_many :grades
  has_many :teachers, through: :grades
  has_many :courses
end
