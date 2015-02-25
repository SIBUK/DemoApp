class ImagesController < ApplicationController
  private
  def image_params
    params.require(:image).permit(:name, :image)
  end

  public

  def index
    @image = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
    #@catergory = Catergory.all
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to images_path, :notice => "Your Image has been saved"
    else
      render "new"
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(image_params)
      redirect_to images_path, :notice => "Your Image has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.delete
    redirect_to images_path, :notice => "Your Image was deleted"
  end
end
