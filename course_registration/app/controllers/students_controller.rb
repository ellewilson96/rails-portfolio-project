class StudentsController < ApplicationController

  def index
    if params[:user_id]
      @students = current_user.students
      @grades = current_user.grades
    else
        @students = Student.all
        @grades = Grade.all
      end
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = current_user.students.build(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end


end
