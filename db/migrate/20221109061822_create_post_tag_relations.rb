class CreatePostTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tag_relations do |t|
      t.integer :post_id
      t.integer :tag_id
      t.index ["post_id"], name: "index_post_tags_on_post_id"
      t.index ["tag_id"], name: "index_post_tags_on_tag_id"

      t.timestamps
    end
  end
end
