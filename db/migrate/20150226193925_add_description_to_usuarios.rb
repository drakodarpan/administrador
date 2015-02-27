class AddDescriptionToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :description, :string
  end
end
