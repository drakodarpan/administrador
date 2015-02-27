class Comentario < ActiveRecord::Base
  belongs_to :usuario

  validates :comentario, presence: true, length: { maximum: 150 }
end
