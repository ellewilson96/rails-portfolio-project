class StudentsController < ApplicationController
  def index

end

  def show

end

  def new
    @student = Student.new
  end

  def create
    @student = current_user.students
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
