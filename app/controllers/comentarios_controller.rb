class ComentariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:index, :show, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_comments

  def index
    @all_comments = Comentario.all
  end

  def new
    @new_comment = Comentario.new
  end

  def create
    @new_comment = Comentario.new(secure_params)

=begin
    respond_to do |format|
      if @new_comment.save
      else
        format.html { render :new }
        format.json { render json: @new_comment, status: :unprocessable_entity }
      end
    end
=end

    if @new_comment.valid?
      @new_comment.save
      flash[:notice] = "Message sent from #{@new_comment.comentario}"
      redirect_to comentarios_path
    else
      render :new
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
