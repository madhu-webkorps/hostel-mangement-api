class AdminController < ApplicationController

    def hostels
        hostels = current_user.hostels
        no_of_rooms = []
        hostels.each do |h|
            no_of_rooms << h.rooms.count
        end
        
        render json:{
          Admin_name: current_user.first_name+" "+current_user.last_name,
          total_hostels: hostels.count,
          hostel_locations: hostels.pluck(:location)
         }
    end
end
