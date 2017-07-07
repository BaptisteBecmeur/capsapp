class ReservationsController < ApplicationController

  before_action :autheticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    @reservation = current_user.reservation.create(reservation_params)
    redirect_to @reservation.prestation, notice: "Votre réservation a été acceptée"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def reservations_params
    params.require(:reservations).permit(:start_date, :end_date, :price, :total, :room_id)

  end

end
