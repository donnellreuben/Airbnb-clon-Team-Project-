class ReservationsController < ApplicationController

  def index
    @reservations = Reservations.all 
    render :index 
  end 

end
