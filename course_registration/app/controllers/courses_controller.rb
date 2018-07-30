class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
  @course = Course.create(course_params)
  redirect_to course_path(@course)
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find_by_id(params[:id])
  end

  private
  def course_params
    params.require(:course).permit(:name, :number)
  end
end
