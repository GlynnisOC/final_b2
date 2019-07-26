class Course < ApplicationRecord
  validates_presence_of :name
  has_many :course_students
  has_many :students, through: :course_students

  def grade(student)
    course_students.where("#{student.id} = student_id").pluck(:grade).first
  end
end
