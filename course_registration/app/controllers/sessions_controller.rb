class SessionsController < ApplicationController
  def new
     if current_teacher
       redirect_to '/'
     else
       @teacher = Teacher.new
     end
   end

   def create
     @teacher = Teacher.find_by(username: params[:teacher][:username])
     if @teacher && @teacher.authenticate(params[:teacher][:password])
       @teacher.save
       session[:teacher] = @teacher
       redirect_to teacher_path(@teacher)
     else
       redirect_to signup_path
     end
   end

   def facebook
     @teacher = Teacher.find_or_create_by(uid: auth['uid']) do |u|
       u.uid = auth['uid']
       u.name = auth['info']['username']
     end

     session[:teacher] = @teacher

     redirect_to root_path
   end

   def destroy
     session[:teacher] = nil
     redirect_to root_path
   end

   private
   def auth
     request.env['omniauth.auth']
   end

   def session_params
     params.require(:teacher).permit(:username, :password)
   end
end
