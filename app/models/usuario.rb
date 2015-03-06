#language: utf-8
class Usuario < ActiveRecord::Base
  has_many :comentarios
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Avatar
  has_attached_file :avatar,
                    :styles => { :medium => "300x300", :thumb => "100x100>" },
                    :default_url => 'missing.jpg'

  validates_attachment :avatar,
                       :size => { :in => 0..30.kilobytes },
                       :content_type => { :content_type => /\Aimage\/.*\Z/ }

  # Description
  validates :description, length: { maximum: 200 }
  validates :name,
             length: { minimum: 5 }, # Lo deje en 5 por nombres como David, Laura, etc..
             presence: true,
             uniqueness: true

  validates :apellido,
             presence: true

  # Se anexa, aunque no es necesario, puesto que devise realiza dicha validación del email
  validates :email,
             format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ },
             uniqueness: true

end
