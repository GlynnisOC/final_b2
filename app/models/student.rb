class Student < ApplicationRecord
  validates_presence_of :name
  has_many :course_students, through: :students
  has_many :courses
end
