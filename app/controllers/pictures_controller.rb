class PicturesController < ApplicationController
  before_action :current_user_must_be_picture_rafter,
                only: %i[edit update destroy]

  before_action :set_picture, only: %i[show edit update destroy]

  def index
    @q = Picture.ransack(params[:q])
    @pictures = @q.result(distinct: true).includes(:rafter, :rapid,
                                                   :comments, :likes, :river, :friendship).page(params[:page]).per(10)
  end

  def show
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @picture = Picture.new
  end

  def edit; end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      message = "Picture was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @picture, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "Picture was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    message = "Picture was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to pictures_url, notice: message
    end
  end

  private

  def current_user_must_be_picture_rafter
    set_picture
    unless current_user == @picture.rafter
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:rapid_id, :uploaded_by, :picture)
  end
end
