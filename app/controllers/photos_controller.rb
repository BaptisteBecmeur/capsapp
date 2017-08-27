class PhotosController < ApplicationController

 def destroy
  @photo = Photo.find(params[:id])
  prestation = @photo.prestation
  @photo.destroy
  @photos = Photo.where(prestation_id: prestation.id)
  respond_to :js
 end


end
