class CreateMangas < ActiveRecord::Migration[5.1]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :path
      t.integer :good
      t.integer :bad
      t.string :comment

      t.timestamps
    end
  end
end
