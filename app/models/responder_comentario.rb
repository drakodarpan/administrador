class ResponderComentario < ActiveRecord::Base
  belongs_to :comentario

  validates :respuesta_comentario, length: { maximum: 200 }
end
