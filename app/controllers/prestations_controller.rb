class PrestationsController < ApplicationController

before_action :set_prestation, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
before_action :require_same_user, only: [:edit, :update]
  def index
    @prestations = current_user.prestations
  end

  def show
    @photos = @prestation.photos
  end

  def new
    @prestation = current_user.prestations.build
  end

  def create
    @prestation = current_user.prestations.build(prestation_params)
    if @prestation.save
      if params[:images]
          params[:images].each do |i|
            @prestation.photos.create(image: i)
        end
      end
      @photos = @prestation.photos
      redirect_to edit_prestation_path(@prestation), notice:"Votre prestation a été ajouté avec succès"
    else
      render :new
    end
  end

  def edit
    @photos = @room.photos
  end

  def update
    if prestation.update(prestation_params)
       if params[:images]
          params[:images].each do |i|
            @prestation.photos.create(image: i)
        end
      end
      @photos = @prestation.photos
      redirect_to edit_prestation_path(@prestation), notice: "Modification enregistrée"
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_prestation
      @prestation = Prestation.find(params[:id])
    end

    def prestation_params
     params.require(:prestation).permit(:talent, :showing_type, :duration, :zone_km, :name_scene, :listing_name, :summary, :address, :zip_code, :city, :country, :is_equipment, :is_indoor, :price, :active )
    end

    def require_same_user
      if current_user.id != @room.user_id
        flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
        redirect_to root_path
      end
    end
end
