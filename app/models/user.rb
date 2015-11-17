class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  validates :nombre, :presence => true
  validates :apellido, :presence => true
         
  has_many :bufetes, dependent: :destroy
  
  PLANES_REGISTRO = ["Prueba", "Basico", "Premium"]
  
  def nombre_completo
    "#{self.nombre} #{self.apellido}"
  end
  
end
