class AddImageToManga < ActiveRecord::Migration[5.1]
  def change
    add_column :mangas, :image, :string
  end
end
