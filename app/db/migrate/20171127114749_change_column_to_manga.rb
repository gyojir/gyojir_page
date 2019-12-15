class ChangeColumnToManga < ActiveRecord::Migration[5.1]
  def change
    change_column :mangas, :good, :integer, null: false, default: 0
    change_column :mangas, :bad, :integer, null: false, default: 0
  end
end
