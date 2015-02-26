class Comentario < ActiveRecord::Base
  belongs_to :usuario

  validates_presence_of :comentario
  validates :comentario, length: { maximum: 150 }
end
