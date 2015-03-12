class UsuariosController < ApplicationController
  before_filter :authenticate_usuario!, only: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_access

  def index
    @usuarios = Usuario.all
  end

  def show
    @show_user = Usuario.find(params[:id])
  end

  private
    def invalid_access
      redirect_to root_path, notice: 'Se tiene que registrar para poder ver la información...'
    end
end
