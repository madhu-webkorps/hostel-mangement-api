class HostelsController < ApplicationController
    before_action :authenticate_user ,  only: [:create, :update, :destroy, :index]
    before_action :set_hostel, only: [:show, :update, :destroy] 
    

    # /hostels  - return all hostels for user dashboard
    def index
      if signed_in? && current_user.admin?
        hostels = current_user.hostels.pluck_to_hash(:id, :name, :location, :about).paginate(:page => params[:page], :per_page => 10)


      else
        debugger
        if params['search_term'].present?
          search_key = "%#{params['search_term'].downcase}%"
          hostels = Hostel.where('location like ?', search_key).paginate(:page => params[:page], :per_page => 10)


        else
         hostels = Hostel.all.pluck_to_hash(:id, :name, :location, :about).paginate(:page => params[:page], :per_page => 10)


        end 
      end
      debugger
        render json:{
            hostels: hostels
        }
       
          
    end


    # only admin can cereate any hostel record
    def create
      hostel = Hostel.new(hostel_params)
      hostel.user = @current_user
      if hostel.save!
      render json:{
          data: hostel,
          message: "your hostel is created successfully"
            }
      else 
        render json: {error: hostel.errors}
      end
    end


    # user or admin can view detalis of perticular hostel
    def show
      hostel_detalis = @hostel.attributes.slice("id", "name", "location", "about")
      render json:{
        hostel_detalis:  hostel_detalis,
        Hostel_owner: @owner.first_name,
        contact_no: @owner.contact_no,
        protocols:  @hostel.protocols,
        services:  @hostel.services
      }
    end

    # only admin can update any hostel record
    def update 
      @hostel = hostel.update(hostel_params)
      if @hostel
        render json:{
          message: "Hostel detalis is updated successfully",
          details: hostel
      }
      else
        render json:{
          error: hostel.errors
      }
      end
    end


# only admin can cereate any hostel record
    def destroy 
     if hostel.destroy
       render json:{
          message: "Hostel is removed from this site successfully"
       }
     else
      render json: {error: hostel.errors}
     end
    end

    # search hostel by locations 
    def search_hostel
      hostels = Hostel.where()
    end
    

    def set_hostel
      @hostel = Hostel.find(params[:id])
      @owner = @hostel.user if @hostel.user.admin? 
    end

    def hostel_params
      params.require(:hostel).permit(:name, :location, :about)
    end

    def protocols_params
      params.require(:protocol).permit(:discription)
    end

end
