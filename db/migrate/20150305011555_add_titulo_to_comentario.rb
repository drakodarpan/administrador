class AddTituloToComentario < ActiveRecord::Migration
  def change
    # rails g migration add_titulo_to_comentario titulo:string
    add_column :comentarios, :titulo, :string
  end
end
