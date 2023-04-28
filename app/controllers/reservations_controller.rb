class ReservationsController < ApplicationController

  # NEW
  def new
    # @room = Room.find(params[:room_id])
    @reservations = Reservation.new
  end

  #INDEX
  def index
    @reservations = Reservation.all 
    render :index 
  end 

# CREATE
  def create 
    @reservations = Reservation.new(
      user_id: params[:reservations][:user_id],
      room_id: params[:reservations][:room_id],
      start_date: params[:reservations][:start_date],
      end_date: params[:reservations][:end_date],
      price: params[:reservations][:price],
      total: params[:reservations][:total],
      )
    @reservations.save
    redirect_to "/reservations"
  end 

#SHOW
  def show
    @reservation = Reservation.find(params[:id])
    render :show
  end

# EDIT
  def edit
    @reservation = Reservation.find(params[:id])
    render :edit 
  end

  def update 
    @reservation = Reservation.find(params[:id])
    @reservation.update(
      user_id: params[:reservations][:user_id],
      room_id: params[:reservations][:room_id],
      start_date: params[:reservations][:start_date],
      end_date: params[:reservations][:end_date],
      price: params[:reservations][:price],
      total: params[:reservations][:total],
    )

    redirect_to "/reservations"
  end

# DELETE/DESTROY
  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.destory 

    redirect_to "/reservations"
  end 

end
