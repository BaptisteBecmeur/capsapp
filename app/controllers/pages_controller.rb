class PagesController < ApplicationController
  def home
    @q = Prestation.active.ransack(params[:q])
    @prestations = Prestation.order("RANDOM()").limit(9)
  end

  def search
    @q = Prestation.active.ransack(params[:q])
    @prestations =
      if @q.result.any?
        @q.result.includes(:reservations)
      else
        Prestation.active
      end
  end
end
