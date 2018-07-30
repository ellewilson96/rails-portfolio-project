class SessionsController < ApplicationController

  def create
   @teacher = Teacher.find_or_create_by(uid: auth['uid']) do |u|
     u.username = auth['info']['username']
   end
    session[:teacher_id] = @teacher.id
    render 'welcome/home'
  end

private
  def auth
    request.env['omniauth.auth']
  end
end
