#language: utf-8
class ComentariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:index, :show, :new, :create, :update, :edit]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_comments

  def index
    @all_usuarios = Usuario.all
  end

  def new
    @comment = Comentario.new
  end

  def create
    @usuario = Usuario.find(current_usuario.id)
    @new_comment = @usuario.comentarios.new(secure_params)

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
      flash[:notice] = "El comentario se actualizo correctamente..."
      redirect_to comentarios_path
    else
      flash[:notice] = "Error al actualizar el comentario #{@update_comment.comentario}"
      render :edit
    end
  end

  private
    def secure_params
      params.require(:comentario).permit(:comentario)
    end

    def invalid_comments
      redirect_to comentarios_path, notice: '¡¡¡Problema con los comentarios!!!'
    end
end
