class AddApellidoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :apellido, :string
  end
end
