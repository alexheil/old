class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :image
      t.string :anchor, default: ""
      t.string :link. default: ""
      t.string :slug

      t.timestamps
    end

    add_index :categories, :slug
  end
end
