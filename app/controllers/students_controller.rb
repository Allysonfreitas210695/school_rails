class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :show, :update, :destroy]


  def index
    @students = Student.all.order(:name)
  end

  def new
    @student = Student.new
  end

  def edit; end

  def show; end

  def update
    if@student.update(params_student)
      redirect_to root_path, notice: 'Teacher with update success!'
    else
      render :edit
    end
  end

  def create
    @student = Student.new(params_student)
    if@student.save
      redirect_to root_path, notice: 'Teacher create with success'
    else
      render :new
    end
  end

  def destroy
    if @student.destroy
      redirect_to root_path, notice: 'Teacher destroy with success!'
    else
      render :index
    end
  end

  private

  def params_student
    params
    .require(:student)
    .permit(
            :name,
            :registration,
            :discipline_id,
            :avatar
          )
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
