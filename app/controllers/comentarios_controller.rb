#language: utf-8
class ComentariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:index, :show, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_comments

  def index
    @all_comments = Usuario.all #.where(:usuario_id => current_usuario) # Comentario.all
  end

  def new
    @comment = Comentario.new
  end

  def create
    @new_comment = Comentario.new(secure_params)

    if @new_comment.valid?
      flash[:notice] = "Message sent from #{@new_comment.comentario}"
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
      flash[:notice] = "Error al actualizar la información de #{@update_comment.comentario}"
      reder :edit
    end
  end

  private
    def secure_params
      params.require(:comentario).permit(:comentario, :usuario_id)
    end

    def invalid_comments
      redirect_to comentarios_path, notice: '¡¡¡Problema con los comentarios!!!'
    end
end
