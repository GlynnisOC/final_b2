require 'rails_helper'

RSpec.describe CourseStudent do
  describe "validations" do
    it { should validate_presence_of :grade }
  end

  describe 'relationships' do
    it { should belong_to :course }
    it { should belong_to :student }
  end

  describe 'class methods' do
    it '.stars_to_suckers' do
      @billy = Student.create!(name: "Billy")
      @bob = Student.create!(name: "Bob")
      @joe = Student.create!(name: "Joe")
      @geometry = Course.create!(name: "Geometry")
      @history = Course.create!(name: "History")
      @english = Course.create!(name: "English")
      @billy_geo = @geometry.course_students.create!(student_id: @billy.id, grade: 79.0)
      @joe_eng = @english.course_students.create!(student_id: @joe.id, grade: 64.5)
      @joe_history = @history.course_students.create!(student_id: @joe.id, grade: 89.0)
      @billy_history = @history.course_students.create!(student_id: @billy.id, grade: 78.0)
      @bob_geo = @geometry.course_students.create!(student_id: @bob.id, grade: 66.0)
      @joe_geo = @geometry.course_students.create!(student_id: @joe.id, grade: 72.0)

      expect(@geometry.course_students.stars_to_suckers).to eq([@billy_geo, @joe_geo, @bob_geo])
    end
  end
end
