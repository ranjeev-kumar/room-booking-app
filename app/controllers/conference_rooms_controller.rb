class ConferenceRoomsController < ApplicationController
  before_action :set_conference_room, only: [:show, :edit, :update, :destroy]
  before_action :set_facilities, only: [:new, :edit]

  # GET /conference_rooms
  # GET /conference_rooms.json
  def index
    @conference_rooms = ConferenceRoom.all
  end

  # GET /conference_rooms/1
  # GET /conference_rooms/1.json
  def show
  end

  # GET /conference_rooms/new
  def new
    @conference_room = ConferenceRoom.new
  end

  # GET /conference_rooms/1/edit
  def edit
  end

  # POST /conference_rooms
  # POST /conference_rooms.json
  def create
    @conference_room = ConferenceRoom.new(conference_room_params)

    respond_to do |format|
      if @conference_room.save
        format.html { redirect_to @conference_room, notice: 'Conference room was successfully created.' }
        format.json { render :show, status: :created, location: @conference_room }
      else
        format.html { render :new }
        format.json { render json: @conference_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conference_rooms/1
  # PATCH/PUT /conference_rooms/1.json
  def update
    respond_to do |format|
      if @conference_room.update(conference_room_params)
        format.html { redirect_to @conference_room, notice: 'Conference room was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference_room }
      else
        format.html { render :edit }
        format.json { render json: @conference_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conference_rooms/1
  # DELETE /conference_rooms/1.json
  def destroy
    @conference_room.destroy
    respond_to do |format|
      format.html { redirect_to conference_rooms_url, notice: 'Conference room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference_room
      @conference_room = ConferenceRoom.find(params[:id])
    end

    def set_facilities
      @facilities = Facility.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_room_params
      params.require(:conference_room).permit! #(:room_no, :description, :facilities_fields)
    end
end
