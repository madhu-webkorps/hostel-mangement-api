class RoomsController < ApplicationController
before_action :set_current_hostel, only: [:create]

# /hostel/:id/rooms  this api return no fo rooms in hostel
    def index
      hostel = Hostel.find(params[:id])
      rooms = hostel.rooms.where("seater > ?", 0).paginate(:page => params[:page], :per_page => 10)
      render json: {
        data: rooms.pluck_to_hash(:id, :room_no, :seater, :fees)
      }
    end

  # only admin can add detalils of room in hostel
    def create
        room = Room.new(room_params) if current_user && current_user.admin?
        room.hostel = @hostel
        if room.save!
          render json:{
            message: "Room is created for hostel #{@hostel.name} in #{@hostel.location}",
            details: room
          }
        else
          render json:{
            error: room.errors
          }
        end
    end

    def show
      room = Room.select(:id, :fees, :seater).find(params[:id])
      render json: {
        details: room
      }
    end

# only admin can add detalils of room in hostel
    def update
      debugger
      @room = Room.find(params[:id])
      if @room.update(room_params)
        render json: {
          message: "detalis of room update successfully",
          data: @room
        }
      else
        render json: {
        error: @room.errors
        }
      end
    end

#/hostel/:id/room/:id
    def destroy
      @room = Room.find(params[:id])
      if @room.destroy
        render json: {message: "room remove from hostel #{@hostel&.name} sucessfully"}
      else
        render json: {
        error: @room.errors
        }
      end
    end


  def set_current_hostel
    @hostel = Hostel.find(params[:id]) if current_user && current_user.admin?
  end

    def room_params 
      params.require(:room).permit(:room_no, :seater, :fees)
    end
end
