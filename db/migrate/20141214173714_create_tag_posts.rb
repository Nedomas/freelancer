class CreateTagPosts < ActiveRecord::Migration
  def change
    create_table :tag_posts do |t|
      t.references :tag, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
