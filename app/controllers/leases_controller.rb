class LeasesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @lease = Lease.all
  end

  def new
    @lease = Lease.new
  end

  def create
    @lease = Lease.new(lease_params)
    if @lease.save
      redirect_to @lease
    else
      render 'new'
    end
  end

  def show
    @lease = Lease.find(params[:id])
    @reviews = Review.where(lease_id: @lease)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def search
    if params[:search].present?
      @leases = Lease.search(params[:search])
    else
      @leases = Lease.all
    end
  end
private

  def lease_params
    params.require(:lease).permit(:address, :province, :city, :university, :postalcode, :numberofbedrooms,
                  :numberofparkingspots, :numberofbathrooms, :utilities, :internet)
  end
end
