class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :comentario
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
