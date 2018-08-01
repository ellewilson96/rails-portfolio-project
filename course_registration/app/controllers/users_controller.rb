class UsersController < ApplicationController

  def show
    @grades = Grade.all
    @students = Student.all
  end
end
