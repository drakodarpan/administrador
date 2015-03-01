#language: utf-8
class ComentariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:index, :show, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_comments

  def index
    @all_comments = Usuario.all
  end

  def new
    @comment = Comentario.new
  end

  def create
    @new_comment = Comentario.new(secure_params)

    if @new_comment.valid?
      @new_comment.save
      flash[:notice] = "El comentario #{@new_comment.comentario} se dio de alta..."
      redirect_to comentarios_path
    else
      render :new
    end

  end

  def show
    @show_comment = Comentario.find(params[:id])
  end

  def edit
    @comment = Comentario.find(params[:id])
  end

  def update
    @update_comment = Comentario.find(params[:id])
    if @update_comment.valid?
      @update_comment.update(secure_params)
      redirect_to comentarios_path
    else
      flash[:notice] = "Error al actualizar el comentario #{@update_comment.comentario}"
      render :edit
    end
  end

  private
    def secure_params

      parameters = params.require(:comentario).permit(:comentario, :usuario_id)
      parameters[:usuario_id]

=begin
      usuario_id = current_usuario.id
      params = ActionController::Parameters.new(usuario_id: current_usuario.id)
      Rails.logger.debug "#{usuario_id} es igual a #{current_usuario.id}"
      params.require(:comentario).permit(:comentario, usuario_id: { usuario_id: current_usuario.id })
=end
    end

    def invalid_comments
      redirect_to comentarios_path, notice: '¡¡¡Problema con los comentarios!!!'
    end
end
