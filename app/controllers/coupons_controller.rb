class CouponsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_coupon, only:[:show, :edit, :update, :destroy]
    
    load_and_authorize_resource
    
    def index
        @coupons = Coupon.all
        
        # Pagination
        @coupons = @coupons.paginate(:page => params[:page], :per_page => 10)
       
        @title = "Cupones"
    end
    
    def new
        @coupon = Coupon.new
    end
    
    def create
        @quantity = params[:quantity].to_i
        
        respond_to do |format|
            # Generate N number of coupons
            @quantity.times do |i|
                @coupon = Coupon.new(coupon_params)
                
                # Generate and assign a random Token for the Coupon
                @coupon.code = generate_token
                
                if !@coupon.save
                    format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de crear el cupon.' } }
                    return
                end
            end
            format.html { redirect_to coupons_path, :flash => { :success => 'Los cupones han sido creados exitosamente' } }
        end
    end
    
    def show
    end
    
    def destroy
       respond_to do |format|
            if @coupon.destroy
                format.html { redirect_to coupons_path, :flash => { :success => 'El cupon ha sido eliminado del sistema exitosamente.' } }
            end
        end 
    end
    
    private
    
        def coupon_params
           params.require(:coupon).permit(:code, :plan, :issuer) 
        end
        
        def find_coupon
           @coupon = Coupon.find(params[:id]) 
        end
        
        def generate_token
            "PUTA-12390129012390KSDKL"
        end
end
