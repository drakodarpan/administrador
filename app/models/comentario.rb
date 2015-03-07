class Comentario < ActiveRecord::Base
  belongs_to :usuario
  has_many :responder_comentarios

  #validates :comentario, length: { maximum: 200 }
end
