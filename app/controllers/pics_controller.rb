class PicsController < ApplicationController
  private
  def image_params
    params.require(:pic).permit(:name, :pic)
  end

  public

  def index
    @pic = Pic.all
  end

  def show
    @pic = Pic.find(params[:id])
  end

  def new
    @pic = Pic.new
    #@catergory = Catergory.all
  end

  def create
    @pic = Pic.new(image_params)
    if @pic.save
      redirect_to images_path, :notice => "Your Image has been saved"
    else
      render "new"
    end
  end

  def edit
    @pic = Pic.find(params[:id])
  end

  def update
    @pic = Pic.find(params[:id])
    if @pic.update_attributes(image_params)
      redirect_to images_path, :notice => "Your Image has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @pic = Pic.find(params[:id])
    @pic.delete
    redirect_to images_path, :notice => "Your Image was deleted"
  end
end
