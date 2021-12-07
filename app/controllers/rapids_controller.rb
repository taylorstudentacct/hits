class RapidsController < ApplicationController
  before_action :set_rapid, only: [:show, :edit, :update, :destroy]

  # GET /rapids
  def index
    @rapids = Rapid.all
  end

  # GET /rapids/1
  def show
  end

  # GET /rapids/new
  def new
    @rapid = Rapid.new
  end

  # GET /rapids/1/edit
  def edit
  end

  # POST /rapids
  def create
    @rapid = Rapid.new(rapid_params)

    if @rapid.save
      redirect_to @rapid, notice: 'Rapid was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rapids/1
  def update
    if @rapid.update(rapid_params)
      redirect_to @rapid, notice: 'Rapid was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rapids/1
  def destroy
    @rapid.destroy
    redirect_to rapids_url, notice: 'Rapid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rapid
      @rapid = Rapid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rapid_params
      params.require(:rapid).permit(:name, :river_id, :location, :description)
    end
end
