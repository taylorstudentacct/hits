class RiversController < ApplicationController
  before_action :set_river, only: %i[show edit update destroy]

  def index
    @q = River.ransack(params[:q])
    @rivers = @q.result(distinct: true).includes(:rapids,
                                                 :pictures).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@rivers.where.not(location_latitude: nil)) do |river, marker|
      marker.lat river.location_latitude
      marker.lng river.location_longitude
    end
  end

  def show
    @rapid = Rapid.new
  end

  def new
    @river = River.new
  end

  def edit; end

  def create
    @river = River.new(river_params)

    if @river.save
      redirect_to @river, notice: "River was successfully created."
    else
      render :new
    end
  end

  def update
    if @river.update(river_params)
      redirect_to @river, notice: "River was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @river.destroy
    redirect_to rivers_url, notice: "River was successfully destroyed."
  end

  private

  def set_river
    @river = River.find(params[:id])
  end

  def river_params
    params.require(:river).permit(:name, :location, :description)
  end
end
