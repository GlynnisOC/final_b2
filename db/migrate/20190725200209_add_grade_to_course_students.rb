class AddGradeToCourseStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :course_students, :grade, :float
  end
end
