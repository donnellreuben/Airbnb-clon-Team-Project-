class RoomsController < ApplicationController


# RESERVATIONS 
# The reservations action finds the room that the user wants to reserve and initializes a new Reservation instance variable. It then renders the reservations.html.erb view, which displays a form for creating a new reservation.
  def reservations 
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

# CREATE RESERVATIONS
#The create_reservation action finds the room that the user wants to reserve, builds a new Reservation instance based on the form parameters, sets the user_id attribute to the current user's ID, and then tries to save the reservation to the database. If the reservation is successfully saved, the user is redirected to the show action for the reservation. Otherwise, the reservations.html.erb view is rendered again.
  def create_reservation
    @room = Room.find(params[:id])
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to "/rooms", notice: "Reservation was successfully created"
    else
      render 'reservations'
    end
  end    


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
    @room = current_user.rooms.new(
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
      total_bathrooms: params[:room][:total_bathrooms]
    )

    redirect_to "/rooms"
  end

# DELETE/DESTROY
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path, notice: "Room was successfully deleted"
  end



private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
