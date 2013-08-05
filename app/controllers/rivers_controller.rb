class RiversController < ApplicationController
  before_action :set_river, only: [:show, :edit, :update, :destroy]

  # GET /rivers
  # GET /rivers.json
  def index
    # @rivers = River.search(params[:search])
    @rivers = River.where(:state => params[:state]).paginate(:page => params[:page])
  end

  # GET /rivers/1
  # GET /rivers/1.json
  def show
  end

  def

  # GET /rivers/new
  def new
    @river = River.new
  end

  # GET /rivers/1/edit
  def edit
  end

  # POST /rivers
  # POST /rivers.json
  def create
    @river = River.new(river_params)

    respond_to do |format|
      if @river.save
        format.html { redirect_to @river, notice: 'River was successfully created.' }
        format.json { render action: 'show', status: :created, location: @river }
      else
        format.html { render action: 'new' }
        format.json { render json: @river.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rivers/1
  # PATCH/PUT /rivers/1.json
  def update
    respond_to do |format|
      if @river.update(river_params)
        format.html { redirect_to @river, notice: 'River was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @river.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rivers/1
  # DELETE /rivers/1.json
  def destroy
    @river.destroy
    respond_to do |format|
      format.html { redirect_to rivers_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_river
      @river = River.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def river_params
      params.require(:river).permit(:site_name, :site_code, :refresh_time, :latitude, :longitude, :srs, :county_id, :cfs_value, :state)
    end
end
