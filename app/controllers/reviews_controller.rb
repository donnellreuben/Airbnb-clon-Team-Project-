class ReviewsController < ApplicationController

# INDEX
  def index
    @reviews = Review.all
    render :index
  end

  def new
    @review = Review.new
    render template: "reviews/new"
  end

# CREATE
  def create 
    @reviews = Review.new(
      reservation_id: params[:review][:reservation_id],
      rating: params[:review][:rating],
      comment: params[:review][:comment],
      )
    @reviews.save
    redirect_to "/reviews"
  end 

# SHOW
  def show
    @reviews = Review.find(params[:id])
    render :show
  end

# EDIT
  def edit
    @reviews = Review.find(params[:id])
    render :edit 
  end

# UPDATE
  def update 
    @review = Review.find(params[:id])
    @review.update(
      reservation_id: params[:review][:reservation_id],
      rating: params[:review][:rating],
      comment: params[:review][:comment],
    )

    redirect_to "/reviews"
  end

# DELETE/DESTROY
  def delete
    @reviews = Reviews.find(params[:id])
    @review.destory 

    redirect_to "/reviews"
  end 
end
