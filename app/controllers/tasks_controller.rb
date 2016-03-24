class TasksController < ApplicationController
   before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
  	@tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    #@task.save!

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Note was successfully created.' }
      else
        format.html { render :new }      
      end
    end

  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  def new
 	  @task = Task.new 	
  end
  
private

  def set_task
      @task = Task.find(params[:id])
    end

  def task_params
    params.require(:task).permit(:title, :content, :time)
  end
end
