class CourseStudent < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates_presence_of :grade

  def self.stars_to_suckers
    order(grade: :desc)
  end
end
