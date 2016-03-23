class TasksController < ApplicationController
  def index
  	@tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save!
  end

  def update
  end

  def delete
  end

  def new
 	@task = Task.new 	
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :content, :time)
  end
end
