class AddDescriptionToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :description, :text
  end
end
