class PrestationsController < ApplicationController

before_action :set_prestation, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
  def index
    @prestations = current_user.prestations
  end

  # def show
  #   @prestation = Prestation.find(params[:id])
  # end

  def new
    @prestation = current_user.prestations.build
  end

  def create
    @prestation = current_user.prestations.build(prestation_params)
    if @prestation.save
      redirect_to @prestation, notice:"Votre prestation a été ajouté avec succès"
    else
      render :new
    end
  end

  # def edit
  #   @prestation = Prestation.find(params[:id])
  # end

  def update
    if prestation.update(prestation_params)
      redirect_to @prestation, notice: "Modification enregistrée"
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
end
