class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      render '/'
    end
  end

  def show
    if logged_in?
      @teacher = current_teacher
    else
      redirect_to '/'
    end
  end

  def destroy
    session.delete :teacher_id
    redirect_to '/'
  end

  private

  def teacher_params
    params.require(:teacher).permit(:username, :password, :subject)
  end

end
