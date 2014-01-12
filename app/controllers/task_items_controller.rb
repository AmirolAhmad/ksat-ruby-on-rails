class TaskItemsController < ApplicationController
  before_action :find_ksat_list

  def index
  end

  def new
  	@task_item = @ksat_list.task_items.new
  end

  def create
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
    @task_item = @ksat_list.task_items.find(params[:id])
  end

  def update
    @task_item = @ksat_list.task_items.find(params[:id])
    if @task_item.update_attributes(task_item_params)
      flash[:success] = "Saved task list item."
      redirect_to ksat_list_task_items_path
    else
      flash[:error] = "That task item could not be saved."
      render action: :edit
    end
  end

  def destroy
    @task_item = @ksat_list.task_items.find(params[:id])
    if @task_item.destroy
      flash[:success] = "Task list item was successfully deleted."
    else
      flash[:error] = "Task list item couldn't be deleted."
    end
    redirect_to ksat_list_task_items_path
  end

  def complete
    @task_item = @ksat_list.task_items.find(params[:id])
    @task_item.update_attribute(:completed_at, Time.now)
    redirect_to ksat_list_task_items_path, notice: "Task item successfully marked as complete."
  end

  def url_options
    { ksat_list_id: params[:ksat_list_id] }.merge(super)
  end

  private
  def find_ksat_list
    @ksat_list = KsatList.find(params[:ksat_list_id])
  end

  def task_item_params
  	params[:task_item].permit(:content)
  end
end
