class GradesController < ApplicationController

  def index
    @grades = Grade.all
  end
  
  def new
  @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    redirect_to teacher_path(@teacher)
  end

  def edit
  end

  def update
  end

  private

  def grade_params
    params.require(:grade).permit(:student_id, :teacher_id, :letter_grade, :behavior)
  end


end
