class Forum < ActiveRecord::Base
  #Relacines de la bases de datos
  has_many :comments # Un foro públicado puede tener muchos comentarios
  belongs_to :user #Un foro es publicado solo por un usuario
  enum forum_type: [:Vida, :Emprendimiento, :Profesional]

  validates :title, :description, presence: true
end
