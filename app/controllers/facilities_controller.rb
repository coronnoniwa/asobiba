class FacilitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

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
    @rooms = @facility.rooms
  end
  
  def destroy
    @facility = Facility.find(params[:id])
    if @facility.destroy
      flash[:notice] = "Facility was successfully deleted."
      redirect_to "#"
    else
      flash[:alert] = "Failed to delete the facility."
      render :show
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      redirect_to facility_path(@facility)
    else
      render :edit
    end
  end

  private
  def facility_params
    params.require(:facility).permit(:name, :image, :explanation, :prefecture_id, :city, :facility_link, :place_link)
                                    .merge(user_id: current_user.id)
  end
end
