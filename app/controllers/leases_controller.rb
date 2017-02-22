class LeasesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :index, :show,  :update]


  def index
    @leases = Lease.all

    @markers = @leases.collect do |lease|
      @id = view_context.link_to "Go To Lease", lease_path(lease.id)
      [lease.address.to_s, lease.latitude.to_f, lease.longitude.to_f, lease.city.to_s, lease.province.to_s, lease.postalcode.to_s, lease.utilities, lease.internet, lease.laundry, lease.furnished, lease.numberofbathrooms, lease.numberofbedrooms, lease.numberofparkingspots, lease.typeOfHouse, lease.university, @id]
    end

  end

  def new
    @lease = Lease.new
    render :layout => "leaseCreatePageLayout"

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
    @marker = [@lease.address.to_s, @lease.latitude.to_f, @lease.longitude.to_f, @lease.city.to_s, @lease.province.to_s, @lease.postalcode.to_s]

    if @lease.reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @lease.reviews.average(:rating).round(2)
    end

    render :layout => "leaseShowPageLayout"

  end

  def search
    if params[:search].present?
      @leases = Lease.search(params[:search])
    else
      @leases = Lease.all
    end

    @leases = Lease.all

    @markers = @leases.collect do |lease|
      @id = view_context.link_to "Go To Lease", lease_path(lease.id)
        [lease.address.to_s, lease.latitude.to_f, lease.longitude.to_f, lease.city.to_s, lease.province.to_s, lease.postalcode.to_s, @id]
    end

    @center = Geocoder::Calculations.geographic_center(
        @leases.collect do |lease|
        [lease.latitude.to_f, lease.longitude.to_f]
      end)

  end

  def update
    @lease = Lease.find(params[:id])
    if @lease.update_attributes(lease_params)
     flash[:success] = "Images updated"
     redirect_to @lease
    else
     render 'show'
   end
  end

private

  def lease_params
    params.require(:lease).permit(:address, :province, :city, :university, :postalcode, :numberofbedrooms,
                :numberofparkingspots, :numberofbathrooms, :utilities, :internet, :laundry, :typeOfHouse, :furnished, image: [])
  end
end
