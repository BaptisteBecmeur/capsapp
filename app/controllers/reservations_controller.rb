class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to @reservation.prestation, notice: "Votre réservation a été acceptée"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :prestation_id)

  end

end
