class ComentarioController < ApplicationController
  def index
    @all_comments = Comentario.all
  end

  def new
  end

  def show
  end
end
