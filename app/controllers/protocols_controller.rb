class ProtocolsController < ApplicationController
before_action :hostel ,only: [:create]

    def index
      protocols = Hostel.find(params[:id]).protocols.pluck_to_hash(:discription)
      render json: {protocols: protocols }
    end

    def create
      protocol = @hostel.protocol.new(protocols_params)
      if protocol.save!
        render json: {
          message: "protocol added for hostel #{@hostel.name}",
          protocol: protocol
        }
      else
        render json:{
          error: protocol.errors
        }
      end


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
