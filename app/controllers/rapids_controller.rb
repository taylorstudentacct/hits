class RapidsController < ApplicationController
  before_action :set_rapid, only: %i[show edit update destroy]

  def index
    @q = Rapid.ransack(params[:q])
    @rapids = @q.result(distinct: true).includes(:river,
                                                 :pictures).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@rapids.where.not(location_latitude: nil)) do |rapid, marker|
      marker.lat rapid.location_latitude
      marker.lng rapid.location_longitude
    end
  end

  def show
    @picture = Picture.new
  end

  def new
    @rapid = Rapid.new
  end

  def edit; end

  def create
    @rapid = Rapid.new(rapid_params)

    if @rapid.save
      message = "Rapid was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @rapid, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @rapid.update(rapid_params)
      redirect_to @rapid, notice: "Rapid was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @rapid.destroy
    message = "Rapid was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to rapids_url, notice: message
    end
  end

  private

  def set_rapid
    @rapid = Rapid.find(params[:id])
  end

  def rapid_params
    params.require(:rapid).permit(:name, :river_id, :location, :description,
                                  :difficulty)
  end
end
