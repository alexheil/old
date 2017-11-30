class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :category
      t.references :admin
      t.string :title
      t.string :image
      t.string :image_source, default: ""
      t.string :image_source_link, default: ""
      t.string :link, default: ""
      t.text :content
      t.string :slug

      t.timestamps
    end

    add_index :groups, :slug
  end
end