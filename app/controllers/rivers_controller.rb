class RiversController < ApplicationController
  before_action :set_river, only: [:show, :edit, :update, :destroy]

  # GET /rivers
  def index
    @rivers = River.all
  end

  # GET /rivers/1
  def show
  end

  # GET /rivers/new
  def new
    @river = River.new
  end

  # GET /rivers/1/edit
  def edit
  end

  # POST /rivers
  def create
    @river = River.new(river_params)

    if @river.save
      redirect_to @river, notice: 'River was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rivers/1
  def update
    if @river.update(river_params)
      redirect_to @river, notice: 'River was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rivers/1
  def destroy
    @river.destroy
    redirect_to rivers_url, notice: 'River was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_river
      @river = River.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def river_params
      params.require(:river).permit(:name, :location, :description)
    end
end
