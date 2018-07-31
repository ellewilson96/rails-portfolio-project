class Teachers::SessionsController < Devise::SessionsController
    def index
      @teachers = Teacher.all
    end

    def show
      if current_teacher
        @teacher = Teacher.new
      else
        redirect_to login_path
      end
    end

  def new
    @teacher = Teacher.new
  end

  def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        session[:teacher] = @teacher
        redirect_to teacher_path(@teacher)
      else
        render 'new'
      end
    end


  private

  def teacher_params
    params.require(:teacher).permit(:username, :password)
  end
end
