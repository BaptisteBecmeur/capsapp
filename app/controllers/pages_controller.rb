class PagesController < ApplicationController
  def home
  end

def search
  if params[:search].present? && params[:search].strip != ""
    session[:presta_search] = params[:search]
  end

  arrResult = Array.new

  if session[:presta_search] && session[:presta_search] != ""
    @prestations_address = Prestation.where(active: true).near(session[:presta_search], 5, order:'distance')
  else
    @prestations_address = Prestation.where(active: true).all
  end

  @search = @prestations_address.ransack(params[:q])
  @prestations = @search.result

  @arrRooms = @prestations.to_a

  if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    @prestations.each do |room|
    not_available = prestation.reservations.where("(? <= start_date AND start_date <= ?) OR
    (? <= end_date AND end_date <= ?) OR (start_date < ? AND ? < end_date)", start_date, end_date,
    start_date, end_date, start_date, end_date).limit(1)

      if not_available.length > 0
      @arrRooms.delete(room)
      end
    end
  end
end

end
