class RoomsController < ApplicationController
  before_action :set_facility, only: [:index, :new, :create]

  def index
    @facilities = Facility.all
    @rooms = Room.all
    # .includes(:facility_id).all
  end

  def new
    @facility = Facility.find(params[:facility_id])
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:title, :event_id, :facility_id, user_ids: [])
  end
  

  def set_facility
    @facility = Facility.find_by(id: params[:facility_id])
  end
end