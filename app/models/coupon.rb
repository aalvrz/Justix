class Coupon < ActiveRecord::Base
    validates :code, :presence => true
    validates :plan, :presence => true
    validates :issuer, :presence => true
end
