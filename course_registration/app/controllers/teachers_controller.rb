class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    begin
  @teacher = Teacher.from_omniauth(request.env['omniauth.auth'])
  session[:teacher_id] = @teacher.id
  flash[:success] = "Welcome, #{@teacher.name}!"
  rescue
  flash[:warning] = "There was an error while trying to authenticate you..."
  end
  redirect_to root_path
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
