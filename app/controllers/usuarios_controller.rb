class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:index, :show]

  def index
    @usuarios = Usuario.all
  end

  def show
    @show_user = Usuario.find(params[:id])
  end

end
