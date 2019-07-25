require 'rails_helper'

RSpec.describe 'student show page' do
  describe 'as a user' do
    before :each do
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
    end

    describe "when I visit a specific student's page" do
      it "shows their name, each course and student's grade for each course" do
        visit student_path(@billy)

        expect(page).to have_content("Student's Name: #{@billy.name}")
        expect(page).to_not have_content(@english.name)
        expect(page).to have_content(@history.name)
        expect(page).to have_content(@geometry.name)
        # save_and_open_page
        # expect(page).to have_content()
      end
    end
  end
end

# - the name of each course the student is enrolled in
# - the student's grade for each course