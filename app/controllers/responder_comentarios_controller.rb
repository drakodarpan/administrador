#language: utf-8
class ResponderComentariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_responds

  def new
    @comentario_act = Comentario.where(id: params[:comentario_id])
    @respon_comentario = ResponderComentario.new
  end

  def create
    @comentario = Comentario.find(1)
    @new_respond = @comentario.responder_comentarios.new(secure_params)

    if @new_respond.valid?
      @new_respond.save
      flash[:notice] = "La respuesta se grabo correctamente..."
      redirect_to comentarios_path
    else
      render :new
    end

  end

  private
    def secure_params
      Rails.logger.debug "#{:comentario_id}"
      params.require(:responder_comentarios).permit(:respuesta_comentario)
    end

    def invalid_responds
      redirect_to comentarios_path, notice: '¡¡¡Se presento un problema al entrar a las respuestas!!!'
    end
end
