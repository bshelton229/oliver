class CaseManagersController < ApplicationController
  before_action :set_case_manager, only: [:show, :edit, :update, :destroy]

  # GET /case_managers
  # GET /case_managers.json
  def index
    @case_managers = CaseManager.all
  end

  # GET /case_managers/1
  # GET /case_managers/1.json
  def show;end

  # GET /case_managers/new
  def new
    @case_manager = CaseManager.new
  end

  # GET /case_managers/1/edit
  def edit;end

  # POST /case_managers
  # POST /case_managers.json
  def create
    @case_manager = CaseManager.new(case_manager_params)

    respond_to do |format|
      if @case_manager.save
        format.html { redirect_to @case_manager, notice: 'Case manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @case_manager }
      else
        format.html { render action: 'new' }
        format.json { render json: @case_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_managers/1
  # PATCH/PUT /case_managers/1.json
  def update
    respond_to do |format|
      if @case_manager.update(case_manager_params)
        format.html { redirect_to @case_manager, notice: 'Case manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @case_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_managers/1
  # DELETE /case_managers/1.json
  def destroy
    @case_manager.destroy
    respond_to do |format|
      format.html { redirect_to case_managers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_manager
      @case_manager = CaseManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_manager_params
      params.require(:case_manager).permit(:first_name, :last_name, :phone, :email)
    end
end
