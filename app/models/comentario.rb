class Comentario < ActiveRecord::Base
  belongs_to :usuario
  has_many :responder_comentario
end
