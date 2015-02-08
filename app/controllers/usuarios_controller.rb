class UsuariosController < ApplicationController
  def index
    @usuarios = Usuarios.all
  end

  def show
  end

  def update
  end

  def destroy
  end
end
