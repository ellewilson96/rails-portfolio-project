class SessionsController < ApplicationController
  def create
      teacher = Teacher.find_or_create_by(:uid => auth['uid']) do |teacher|
        teacher.username = auth['info']['username']
      end
      session[:teacher_id] = teacher.try(:id)
    end

    def auth
      request.env['omniauth.auth']
    end
end
