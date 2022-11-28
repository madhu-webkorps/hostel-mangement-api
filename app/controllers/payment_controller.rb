class PaymentController < ApplicationController

    def pay_fees
      debugger
       
        render '/payment/pay_fees', layout: false
  
      
    end

    def success
    end

    def canceled
    end
end
