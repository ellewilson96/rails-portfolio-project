class GradesController < ApplicationController

  def index
  if params[:user_id]
    user = User.find(params[:user_id])
    @grades = current_user.grades
  else 
      @grades = Grade.all
    end
  end

  def new
  @grade = Grade.new
  end

  def create
  @grade = current_user.grades.build(grade_params)
  end

  def edit
  end

  def update
  end

  private

  def grade_params
    params.require(:grade).permit(:student_id, :user_id, :letter_grade, :behavior)
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end
end
