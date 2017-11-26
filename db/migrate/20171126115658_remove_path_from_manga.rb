class RemovePathFromManga < ActiveRecord::Migration[5.1]
  def change
    remove_column :mangas, :path, :string
  end
end
