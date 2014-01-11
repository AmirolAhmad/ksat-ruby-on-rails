class TaskItemsController < ApplicationController
  def index
  	@ksat_list = KsatList.find(params[:ksat_list_id])
  end

  def new
  	@ksat_list = KsatList.find(params[:ksat_list_id])
  	@task_item = @ksat_list.task_items.new
  end

  def create
  	@ksat_list = KsatList.find(params[:ksat_list_id])
  	@task_item = @ksat_list.task_items.new(task_item_params)
  	if @task_item.save
  		flash[:success] = "Added task list item."
  		redirect_to ksat_list_task_items_path
  	else
  		flash[:error] = "There was a problem adding that task list item."
  		render action: :new
  	end
  end

  private
  def task_item_params
  	params[:task_item].permit(:content)
  end
end
