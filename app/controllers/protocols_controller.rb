class ProtocolsController < ApplicationController
before_action :hostel ,only: [:create]

    def create
      protocol = Protocol.new(protocols_params)
      protocol.hostel = @hostel
      if protocol.save!
        render json: {
          message: "protocol added for hostel #{@hostel.name}",
          protocol = protocol
        }

    end

    def update
      protocol = Protocol.update(protocols_params)
      if protocol
        render json: {
          message: "Updated successfully",
          details: protocol
        }
      else
        render json:{
          error: protocol.errors
        }
      end
    end

    def destroy
      protocol = Protocol.find(params[:id])
      if protocol.destroy
        render json: {
          message: "deleted successfully"
        }
      else
        render json: {
          error: protocol.errors
        }
      end
    end

    def hostel
      @hostel = Hostel.find(params[:id])
    end

    def protocols_params
        params.require(:protocol).permit(:discription)
    end
end
