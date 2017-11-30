class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :group
      t.integer :number
      t.string :title
      t.string :image
      t.string :image_source, default: ""
      t.string :image_source_link, default: ""
      t.string :link, default: ""
      t.string :embed, default: ""
      t.text :content
      t.string :slug

      t.timestamps
    end

    add_index :posts, :slug
  end
end
