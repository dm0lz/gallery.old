class PicturesController < ApplicationController
	def create
		#binding.pry
		@gallery = Gallery.find(params[:gallery_id])
		#binding.pry
		@picture = @gallery.pictures.new(params[:picture])
		#binding.pry
		#redirect_to @gallery
		respond_to do |format|
	      if @picture.save
	        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
	        format.json { render json: @gallery, status: :created, location: @gallery }
	        #binding.pry
	        format.js { render :action => 'create' }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @gallery.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def show
		@picture = Picture.find(params[:id])
	end
	def destroy
		#binding.pry
    	@picture = Picture.find(params[:id])
    	@picture.destroy
    	#binding.pry
    	@gallery = Gallery.find(params[:gallery_id])

	    respond_to do |format|
	      format.html { redirect_to @gallery }
	      format.json { head :no_content }
	    end
  end
end
