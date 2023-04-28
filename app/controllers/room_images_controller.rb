class RoomImagesController < ApplicationController

# NEW
  def new
    @room_image = Room_image.new
  end

# INDEX
  def index
    @room_image = Room_image.all 
    render :index 
  end 

# CREATE
  def create 
    @room_image = Room_image.new(
      user_id: params[:roomimage][:user_id],
      room_id: params[:roomimage][:room_id],
      start_date: params[:roomimage][:start_date],
      end_date: params[:roomimage][:end_date],
      price: params[:roomimage][:price],
      total: params[:roomimage][:total],
      )
    @room_image.save
    redirect_to "/room_image"
    end 
end 

# SHOW
  def show
    @room_image = Room_image.find(params[:id])
    render :show
  end

# EDIT
  def edit
    @room_image = room_image.find(params[:id])
    render :edit 
  end

# UPDATE
  def update 
    @room_image = room_image.find(params[:id])
    @room_image.update(
      room_id: params[:roomimage][:room_id],
      url: params[:roomimage][:url]

    )

    redirect_to "/room_image"
end

# DELETE/DESTROY
  def delete
    @room_image = room_image.find(params[:id])
    @room_image.destory 

    redirect_to "/room_images"
  end
end
