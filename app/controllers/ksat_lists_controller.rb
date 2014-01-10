class KsatListsController < ApplicationController
  before_action :set_ksat_list, only: [:show, :edit, :update, :destroy]

  # GET /ksat_lists
  # GET /ksat_lists.json
  def index
    @ksat_lists = KsatList.all
  end

  # GET /ksat_lists/1
  # GET /ksat_lists/1.json
  def show
  end

  # GET /ksat_lists/new
  def new
    @ksat_list = KsatList.new
  end

  # GET /ksat_lists/1/edit
  def edit
  end

  # POST /ksat_lists
  # POST /ksat_lists.json
  def create
    @ksat_list = KsatList.new(ksat_list_params)

    respond_to do |format|
      if @ksat_list.save
        format.html { redirect_to @ksat_list, notice: 'Ksat list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ksat_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @ksat_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ksat_lists/1
  # PATCH/PUT /ksat_lists/1.json
  def update
    respond_to do |format|
      if @ksat_list.update(ksat_list_params)
        format.html { redirect_to @ksat_list, notice: 'Ksat list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ksat_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ksat_lists/1
  # DELETE /ksat_lists/1.json
  def destroy
    @ksat_list.destroy
    respond_to do |format|
      format.html { redirect_to ksat_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ksat_list
      @ksat_list = KsatList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ksat_list_params
      params.require(:ksat_list).permit(:title, :description)
    end
end
