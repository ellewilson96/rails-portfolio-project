class SessionsController < ApplicationController
  def create
   @teacher = Teacher.find_by(username: params[:username])
   if @teacher && @teacher.authenticate(params[:teacher][:password])
     session[:teacher_id] = @teacher.id
     redirect_to teacher_path(@teacher)
   else
     redirect_to '/login'
   end
 end
end
