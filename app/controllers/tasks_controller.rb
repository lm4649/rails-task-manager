class TasksController < ApplicationController
  #  call set_task before show, edit, update and destroy
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # see all tasks
  def index
    @tasks = Task.all
  end
  # see one task
  def show
  end
  # create a task
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new.html.erb'
    end
  end
  # update a task
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit.new.html'
    end
  end
  # delete a task
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  # get the task by id
  def set_task
    @task = Task.find(params[:id])
  end

  # we need to whitelist our params aka
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
