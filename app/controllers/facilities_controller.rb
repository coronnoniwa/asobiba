class FacilitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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
    @rooms = @facility.rooms.paginate(page: params[:page], per_page: 10)
  end
  
  def destroy
    if @facility.destroy
      flash[:notice] = "Facility was successfully deleted."
      redirect_to "#"
    else
      flash[:alert] = "Failed to delete the facility."
      render :show
    end
  end

  def edit
  end

  def update
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

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @facility.user_id
  end
end
