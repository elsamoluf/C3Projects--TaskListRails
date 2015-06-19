class TasksController < ApplicationController
  def index
    @all_tasks = Task.all
    render :index
  end

  def show
    @task = Task.find(params[:id])
    render :show
  end

  def edit
    @task = Task.find(params[:id])
    render :edit_task
  end

  def update
    @task = Task.find(params[:id])
    #if completed before, just do this update
    @task.update(form_params[:task])
    # if not completed before, update again with completed_date set to Time.new

    redirect_to action: :index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(form_params[:task])
    @task.save
    redirect_to action: :index
  end

  def confirm_remove
    @task = Task.find(params[:id])
    render :confirm_remove
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to action: :index
  end



  private


  def form_params
    params.permit(task: [:name, :description, :completed_date, :updated_at])
  end

end
