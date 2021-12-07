class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[show edit update destroy]

  def index
    @q = Friendship.ransack(params[:q])
    @friendships = @q.result(distinct: true).includes(:friend1, :friend2,
                                                      :picture).page(params[:page]).per(10)
  end

  def show; end

  def new
    @friendship = Friendship.new
  end

  def edit; end

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      message = "Friendship was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @friendship, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @friendship.update(friendship_params)
      redirect_to @friendship, notice: "Friendship was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @friendship.destroy
    message = "Friendship was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to friendships_url, notice: message
    end
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:friend1_id, :friend2_id)
  end
end
