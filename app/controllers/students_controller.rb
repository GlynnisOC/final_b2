class StudentsController < ApplicationController

  def show
    # binding.pry
    @student = Student.find(params[:id])
  end
end
