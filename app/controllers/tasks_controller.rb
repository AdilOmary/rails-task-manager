# Task Controller following the User's action.
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(validate_params)
    @task.save
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
      # show the new.html.erb page with the @restaurant here
    end
  end

  def edit
  end

  def update
    if @task.update(validate_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def validate_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
