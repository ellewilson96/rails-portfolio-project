class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_teacher, :logged_in?, :teacher_id

  def current_teacher
    @current_teacher ||= session[:teacher]
  end

  def logged_in?
    !current_teacher.empty?
  end

  def teacher_id
    if current_teacher
      current_teacher['id']
    else
      nil
    end
  end

end
