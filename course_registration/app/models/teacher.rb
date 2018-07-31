class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :grades
  has_many :students, through: :grades


end
