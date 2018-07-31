class Course < ActiveRecord::Base
  has_many :students
  belongs_to :teacher

  accepts_nested_attributes_for :students
end
