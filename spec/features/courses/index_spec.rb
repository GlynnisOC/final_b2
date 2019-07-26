require 'rails_helper'

RSpec.describe 'courses index page' do
  describe 'as a user' do
    before :each do
      @billy = Student.create!(name: "Billy")
      @bob = Student.create!(name: "Bob")
      @joe = Student.create!(name: "Joe")
      @geometry = Course.create!(name: "Geometry")
      @history = Course.create!(name: "History")
      @english = Course.create!(name: "English")
      @geometry.course_students.create(student_id: @billy.id, grade: 79.0)
      @english.course_students.create(student_id: @joe.id, grade: 64.5)
      @history.course_students.create(student_id: @joe.id, grade: 89.0)
      @history.course_students.create!(student_id: @billy.id, grade: 78.0)
      @geometry.course_students.create!(student_id: @bob.id, grade: 66.0)
      @geometry.course_students.create!(student_id: @joe.id, grade: 72.0)
    end

    describe 'when I visit the courses index page' do
      it "I see the course name and each student listed by grade, highest to lowest" do

        visit courses_path

        within "#course-#{@geometry.id}" do
          expect(page).to have_content(@geometry.name)
          expect(page).to have_content(@billy.name)
          expect(page).to have_content(@bob.name)
          expect(page).to have_content(@joe.name)

          expect(page).to have_content(@geometry.grade(@billy))
          expect(page).to have_content(@geometry.grade(@joe))
          expect(page).to have_content(@geometry.grade(@bob))
        end
      end
    end
  end
end
