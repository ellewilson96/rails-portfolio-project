class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_teacher, :logged_in?

  def current_teacher
    @current_teacher ||= Teacher.find_by_id(session[:teacher_id])
  end

  def logged_in?
    current_teacher != nil
  end
end
