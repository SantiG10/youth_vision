class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #Relaciones entre los modelos de la base de datos

  has_many :forums #Un usuario aportar tants foros como el quiera
  has_many :comments #Un usuario puede comentar cuantas veces el quiera

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: {case_sensitive: false}
end
