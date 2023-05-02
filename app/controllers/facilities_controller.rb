class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @facility = Facility.find(params[:id])
  end
  
  private
  def facility_params
    params.require(:facility).permit(:name, :image, :explanation, :prefecture_id, :city, :facility_link, :place_link)
                                    .merge(user_id: current_user.id)
  end
end
