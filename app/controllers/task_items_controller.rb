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

  def edit
    @ksat_list = KsatList.find(params[:ksat_list_id])
    @task_item = @ksat_list.task_items.find(params[:id])
  end

  def update
    @ksat_list = KsatList.find(params[:ksat_list_id])
    @task_item = @ksat_list.task_items.find(params[:id])
    if @task_item.update_attributes(task_item_params)
      flash[:success] = "Saved task list item."
      redirect_to ksat_list_task_items_path
    else
      flash[:error] = "That task item could not be saved."
      render action: :edit
    end
  end

  def url_options
    { ksat_list_id: params[:ksat_list_id] }.merge(super)
  end

  private
  def task_item_params
  	params[:task_item].permit(:content)
  end
end
