class LeaseController < ApplicationController
   def new
    @lease = Lease.new
   end
 end
