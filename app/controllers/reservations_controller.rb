class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def preload
    prestation = Prestation.find(params[:prestation_id])
    today = Date.today
    reservations = prestation.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

    def preview
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      output = {
        conflict: is_conflict(start_date, end_date)
      }

      render json: output
    end


    def create
      @reservation = current_user.reservations.create(reservation_params)
      if @reservation.persisted?
        @payment = Payment.new({ email: User.find(@reservation.user_id).email, token: params[:payment]["token"], reservation_id: @reservation.id, amount: @reservation.total })
      begin
          @payment.process_payment
      if @payment.save
      AppMailer.new_reservation(Prestation.find(@reservation.prestation_id), @reservation).deliver_now
      redirect_to @reservation.prestation, notice: "Votre réservation a été acceptée"
    end

    rescue Exception
      @reservation.destroy
      puts 'Le paiement a échoué'
      redirect_to @reservation.prestation, notice: "Votre paiement a été refusé"
    end

    else
      redirect_to @reservation.prestation, notice: "Votre réservation a échoué"
    end
  end

  def your_books
    @books = current_user.reservations
  end

  def your_reservations
    @prestations = current_user.prestations
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :prestation_id)
  end

  def is_conflict (start_date, end_date)
    prestation = Prestation.find(params[:prestation_id])
    check = prestation.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0 ? true : false
  end

end
