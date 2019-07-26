require 'rails_helper'

RSpec.describe Course do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :course_students }
    it { should have_many(:students).through(:course_students) }
  end

  describe 'Instance Methods' do
    it '.grade(student)' do
      @billy = Student.create!(name: "Billy")
      @bob = Student.create!(name: "Bob")
      @joe = Student.create!(name: "Joe")
      @geometry = Course.create!(name: "Geometry")
      @history = Course.create!(name: "History")
      @english = Course.create!(name: "English")
      @geometry.course_students.create!(student_id: @billy.id, grade: 79.0)
      @english.course_students.create!(student_id: @joe.id, grade: 64.5)
      @history.course_students.create!(student_id: @joe.id, grade: 89.0)
      @history.course_students.create!(student_id: @billy.id, grade: 78.0)
      @geometry.course_students.create!(student_id: @bob.id, grade: 66.0)
      @geometry.course_students.create!(student_id: @joe.id, grade: 72.0)
      
      expect(@geometry.grade(@billy)).to eq(79.0)
    end
  end
end
