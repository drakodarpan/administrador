class CreateResponderComentarios < ActiveRecord::Migration
  def change
    create_table :responder_comentarios do |t|
      t.string :respuesta_comentario
      t.references :comentario, index: true

      t.timestamps null: false
    end
    add_foreign_key :responder_comentarios, :comentarios
  end
end
