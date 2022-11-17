class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.review = @review
    if @review.save
      redirect_to review_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
