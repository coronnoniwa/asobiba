class FacilitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_facility, only: [:show, :edit, :update, :destroy, :room_list_page]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_page, only: [:show, :room_list_page]
  require 'httpclient'

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
    @rooms = @facility.rooms.paginate(page: params[:page], per_page: @page)
    set_weather
  end

  def room_list_page
    @page = params[:per]
    session[:per_page] = @page
    @rooms = @facility.rooms.paginate(page: params[:page], per_page: @page)
    set_weather
    render("show")
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

  def set_weather
    if @facility.prefecture.weather_id != "000000"
      client    = HTTPClient.new
      url       = "https://weather.tsukumijima.net/api/forecast/city/#{@facility.prefecture.weather_id}"
      response  = client.get(url)
      res_json  = JSON.parse(response.body)
      print res_json
      weather = res_json["forecasts"]
      @todayWeather = weather[0]
      @tomorrowWeather = weather[1]
      @dayAfterTomorrowWeather = weather[2]
    end
  end

  def set_page
    @page = session[:per_page] || 5
  end
end
