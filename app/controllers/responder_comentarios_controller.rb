class ResponderComentariosController < ApplicationController
  def new
    @respon_comentario = ResponderComentario.all
  end

  def create
    @comentario = Comentario.find(comentario.id)
    @new_respond = @comentario.responderComentarios.new(secure_params)
  end

  private
    def secure_params
      params.require(:responder_comentario).permit(:respuesta_comentario)
    end

end
