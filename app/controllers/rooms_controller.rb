class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_facility, only: [:new, :create]

  def index
    @facility = Facility.find_by(id: params[:facility_id])
    @facilities = Facility.all
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = @facility.rooms.build(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  def search
    @facilities = Facility.all
    @q = Room.includes(:facility).ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  private
  def room_params
    params.require(:room).permit(:title, :event_id, :facility_id, user_ids: [])
  end
  def set_facility
    @facility = Facility.find(params[:facility_id] || params[:room][:facility_id])
  end
end