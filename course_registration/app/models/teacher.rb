class Teacher < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :grades
  has_many :students, through: :grades
end
