class ReviewsController < ApplicationController
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
    @review = Review.new(
      reservation_id: params[:review][:reservation_id],
      rating: params[:review][:rating],
      comment: params[:review][:comment]
     )
    @review.save!
    render json: {message: "Thank you for your review!"}
  end 
end
