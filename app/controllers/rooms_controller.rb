class RoomsController < ApplicationController
# NEW
  def new
    @room = Room.new
  end

# INDEX
  def index 
  # Only display rooms that dont have any reservations
    if current_user
      @rooms = Room.left_outer_joins(:reservations).where(reservations: { id: nil })
    else
      @rooms = Room.all 
    end
    render "index", rooms: @rooms
  end

# CREATE
  def create 
    @room = Room.new(
      user_id: params[:room][:user_id],
      address: params[:room][:address],
      city: params[:room][:city],
      state: params[:room][:state],
      price: params[:room][:price],
      description: params[:room][:description],
      home_type: params[:room][:home_type],
      room_type: params[:room][:room_type],
      total_occupancy: params[:room][:total_occupancy],
      total_bedrooms: params[:room][:total_bedrooms],
      total_bathrooms: params[:room][:total_bathrooms]
    )
    @rooms.save
    redirect_to "/rooms"
  end

# SHOW
  def show 
    @room = Room.find(params[:id])
    render :show
  end

# EDIT
  def edit
    @room = Room.find(params[:id])
    render :edit 
  end

# UPDATE
  def update 
    @room = Room.find(params[:id])
    @room.update(
      address: params[:room][:address],
      city: params[:room][:city],
      state: params[:room][:state],
      price: params[:room][:price],
      description: params[:room][:description],
      home_type: params[:room][:home_type],
      room_type: params[:room][:room_type],
      total_occupancy: params[:room][:total_occupancy],
      total_bedrooms: params[:room][:total_bedrooms],
      total_bathrooms: params[:room][:total_bathrooms]
    )

    redirect_to "/rooms"
  end

# DELETE/DESTROY
  def delete
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to "/rooms"
  end
end
