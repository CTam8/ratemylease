class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_lease
  before_action :authenticate_user!

  def new
    @review = Review.new(lease: @lease)
  end

  def create
    # @review = current_user.reviews.build(review_params)
    # @review.lease = @lease

    @review = Review.new(review_params)
    @review.lease_id = @lease.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to @lease
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @lease
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to lease_path(@lease)
  end
  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_lease
    @lease = Lease.find(params[:lease_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
