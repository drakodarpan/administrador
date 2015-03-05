#language: utf-8
class ResponderComentariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_responds

  def new
    #@comentario_act = Comentario.find(params[:id])
    @respon_comentario = ResponderComentario.new
  end

  def create
    #@comentario = Comentario.find(comentario.id)
    @new_respond = ResponderComentario.new(secure_params)
  end

  private
    def secure_params
      params.require(:responder_comentarios).permit(:respuesta_comentario, :comentario_id => @comentario_act )
    end

    def invalid_responds
      redirect_to comentarios_path, notice: '¡¡¡Se presento un problema al entrar a las respuestas!!!'
    end
end
