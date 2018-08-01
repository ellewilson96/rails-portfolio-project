class Student < ActiveRecord::Base
  has_many :grades
  has_many :users, through: :grades

end
