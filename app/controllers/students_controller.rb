class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
	  @student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
    @student = Student.new(Student_params(:first_name, :last_name))
    @student.save
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find(params[:id])
    @student.update(Student_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private


  # We pass the permitted fields in as *args;
  # this keeps `Student_params` pretty dry while
  # still allowing slightly different behavior
  # depending on the controller action
  def Student_params(*args)
    params.require(:student).permit(*args)
  end


end
