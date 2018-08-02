class GradesController < ApplicationController

  def index
    @student = Student.find_by_id(params[:student_id])
  if params[:user_id]
    user = User.find(params[:user_id])
    @grades = current_user.grades
  else
      @grades = Grade.all
    end
  end

  def show
  end

  def new
  @student = Student.find_by_id(params[:student_id])
  @grade = @student.grades.build
  end

  def create
    @grade = current_user.grades.build(grade_params)
    @grade.student = Student.find_by_id(params[:student_id])
    if @grade.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @url = student_grade_path
    @grade = Grade.find(params[:id])
    @grade.update_attributes(grade_params)
    if @grade.save
      redirect_to students_path
    else
      render :edit
    end
  end

  private

  def grade_params
    params.require(:grade).permit(:student_id, :user_id, :letter_grade, :behavior)
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end

end
