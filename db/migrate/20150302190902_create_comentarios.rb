class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :comentario
      t.references :usuario, index: true

      t.timestamps null: false
    end
    add_foreign_key :comentarios, :usuarios
  end
end
