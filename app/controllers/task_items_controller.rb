class TaskItemsController < ApplicationController
  def index
  	@ksat_list = KsatList.find(params[:ksat_list_id])
  end
end
