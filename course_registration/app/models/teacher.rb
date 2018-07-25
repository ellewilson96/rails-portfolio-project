class Teacher < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :courses
  has_many :students, through: :courses
end
