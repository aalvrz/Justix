class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :bufetes, dependent: :destroy
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "128x128>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  def can_create_bufete?
    !owner && !bufete.present?
  end
  
  PLANES_REGISTRO = ["Gratuito"]
  
end
