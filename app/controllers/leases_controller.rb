class LeasesController < ApplicationController
  def index
  end

  def new
    @lease = Lease.new
  end

  def create
    @lease = Lease.new(lease_params)
    @lease.save
    redirect_to @lease
  end

  def show
    
  end

private

  def lease_params
    params.require(:lease).permit(:address, :province, :city, :university, :postalcode, :numberofbedrooms,
                  :numberofparkingspots, :numberofbathrooms, :utilities, :internet)
  end
end
