class RoomsController < ApplicationController

# NEW
  def new
    @rooom = Room.new
  end

# INDEX
  def index 
    @rooms = Room.all 
    render :index 
  end

# CREATE
  def create 
    @room = Room.new(
      address: params[:room][:address],
      city: params[:room][:city],
      state: params[:room][:state],
      price: params[:room][:price],
      description: params[:room][:description],
      home_type: params[:room][:home_type],
      room_type: params[:room][:room_type],
      total_occupancy: params[:room][:total_occupancy],
      total_bedrooms: params[:room][:total_bedrooms],
    )
    @room.save
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
