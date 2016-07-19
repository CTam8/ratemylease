class LeasesController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :new]
  def index
  end

  def new
    @lease = Lease.new
  end

  def create
    @lease = Lease.new(lease_params)
    if @lease.save
      redirect_to @lease
    else
      flash[:danger] = @lease.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @lease = Lease.find(params[:id])
  end

private

  def lease_params
    params.require(:lease).permit(:address, :province, :city, :university, :postalcode, :numberofbedrooms,
                  :numberofparkingspots, :numberofbathrooms, :utilities, :internet)
  end
end
