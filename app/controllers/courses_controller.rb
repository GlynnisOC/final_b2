class CoursesController < ApplicationController

  def index
    @courses = Course.all.distinct
  end
end
