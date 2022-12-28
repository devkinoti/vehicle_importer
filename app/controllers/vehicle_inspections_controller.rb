class VehicleInspectionsController < ApplicationController
  before_action :set_vehicle_inspection, only: %i[ show edit update destroy ]

  # GET /vehicle_inspections or /vehicle_inspections.json
  def index
    @vehicle_inspections = VehicleInspection.order(inspection_date: :desc)
  end

  # GET /vehicle_inspections/1 or /vehicle_inspections/1.json
  def show
  end

  # GET /vehicle_inspections/new
  def new
    @vehicle_inspection = VehicleInspection.new
  end

  # GET /vehicle_inspections/1/edit
  def edit
  end

  # POST /vehicle_inspections or /vehicle_inspections.json
  def create
    @vehicle_inspection = VehicleInspection.new(vehicle_inspection_params)

    respond_to do |format|
      if @vehicle_inspection.save
        format.html { redirect_to vehicle_inspection_url(@vehicle_inspection), notice: "Vehicle inspection was successfully created." }
        format.json { render :show, status: :created, location: @vehicle_inspection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_inspections/1 or /vehicle_inspections/1.json
  def update
    respond_to do |format|
      if @vehicle_inspection.update(vehicle_inspection_params)
        format.html { redirect_to vehicle_inspection_url(@vehicle_inspection), notice: "Vehicle inspection was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle_inspection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_inspections/1 or /vehicle_inspections/1.json
  def destroy
    @vehicle_inspection.destroy

    respond_to do |format|
      format.html { redirect_to vehicle_inspections_url, notice: "Vehicle inspection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_inspection
      @vehicle_inspection = VehicleInspection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_inspection_params
      params.require(:vehicle_inspection).permit(:vehicle_id, :inspection_date, :vehicle_org_id, :org_name, :inspection_period_id, :inspection_passed)
    end
end
