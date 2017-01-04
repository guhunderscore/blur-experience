class GalleriesController < ApplicationController
	before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
  	# @galleries = Gallery.all
    respond_to do |format|
      format.html
      
      format.json do
        galleries = Gallery.all
        render json: galleries
      end
    end
  end

  def show; end

  def new
  	@gallery = Gallery.new
  end

  

  def create
  	@gallery = Gallery.new(gallery_params)

  	if @gallery.save
  		redirect_to @gallery, notice: 'Gallery was successfully created.'
  	else
  		render :new
  	end
  end

  def update
  	if @gallery.update(gallery_params)
  		redirect_to @gallery, notice: 'Gallery was successfully updated.'
  	else
  		render :edit
  	end
  end

  def destroy
  	@gallery.remove_image!
  	@gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { render json: { error: [] }, status: 200 }
    end
  end

  private
  	def set_gallery
  		@gallery = Gallery.find params[:id]	
  	end

  	def gallery_params
  		params.require(:gallery).permit(:title, :description, :thank_to, :image)
  	end
end
