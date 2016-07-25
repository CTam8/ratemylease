class ReviewsController < ApplicationController
  before_action :set_lease
  before_action :authenticate_user!

  def new
    @review = Review.new(lease: @lease)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.lease = @lease
    @review.save
    redirect_to @lease
  end

  private

  def set_lease
    @lease = Lease.find(params[:lease_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
