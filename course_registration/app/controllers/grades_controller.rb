class GradesController < ApplicationController

  def index
    @grades = Grade.all
  end

  def new
  @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
  end

  def edit
  end

  def update
  end

  private

  def grade_params
    params.require(:grade).permit(:student_id, :user_id, :letter_grade, :behavior)
  end


end
