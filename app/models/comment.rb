class Comment < ActiveRecord::Base
  #Relaciones de la bases de datos
  validates :comment, presence: true
  
  belongs_to :forum #Un comentario pertenece solo a un foro
  belongs_to :user #un comentario pertenece solo a un usuario
end
