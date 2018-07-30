class StudentsController < ApplicationController
  def index
    if params[:course_id]
      @course = Course.find_by(id: params[:course_id])
    if @course.nil?
      redirect_to courses_path, alert: "Course not found"
    else
      @students = @course.students
    end
  else
    @students = Student.all
  end
end

  def show
    if params[:course_id]
      @course = Course.find_by(id: params[:course_id])
    @student = @course.students.find_by(id: params[:id])
    if @student.nil?
    redirect_to course_students_path(@course), alert: "Student not found"
  end
  else
    @student = Student.find(params[:id])
  end
end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render '/students/new'
    end
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    @student.update(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render '/students/edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "Student removed from course."
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :course_name)
  end

end
