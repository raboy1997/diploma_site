class ImagesController < ApplicationController

  def index
    @images = Image.of_followed_users(current_user.following).order('created_at DESC').page params[:page]
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    @image.user_id = current_user.id
    respond_to do |format|
      if @image.save
        format.html { redirect_to root_path, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
      end
    end
  end

  def show

  end

  def my_images
    @my_images = current_user.images
  end

  private

  def image_params
    params.require(:image).permit(:image, :user_id)
  end
end
