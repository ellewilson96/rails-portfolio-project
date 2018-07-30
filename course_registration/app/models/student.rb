class Student < ActiveRecord::Base
  has_many :grades
  has_many :teachers, through: :grades
  belongs_to :course

  def course_name
    self.try(:course).try(:name)
  end

  def course_name=(name)
    course = Course.find_or_create_by(name: name)
    self.course = course
  end
end
