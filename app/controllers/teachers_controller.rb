class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy]

  def index
    @teachers = Teacher.all.order(:name)
  end

  def new
    @teacher = Teacher.new
  end

  def edit; end

  def update
    if @teacher.update(params_teacher)
      redirect_to root_path, notice: 'Teacher with update success!'
    else
      render :edit
    end
  end

  def create
    @teacher = Teacher.new(params_teacher)
    if @teacher.save
      redirect_to root_path, notice: 'Teacher create with success'
    else
      render :new
    end
  end

  def destroy
    if @teacher.destroy
      redirect_to root_path, notice: 'Teacher destroy with success!'
    else
      render :index
    end
  end

  private

  def params_teacher
    params.require(:teacher).permit(:name, :registration, :department, :discipline)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
