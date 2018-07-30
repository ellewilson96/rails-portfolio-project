class CoursesController < ApplicationController
  def create
  @course = Course.create(course_params)
  redirect_to teacher_path(@course.teacher)
  end

  private
  def course_params
    params.require(:course).permit(:name, :number)
  end
end
