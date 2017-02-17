class StaticPagesController < ApplicationController

  def home
    render :layout => "homePageLayout"
  end

end
