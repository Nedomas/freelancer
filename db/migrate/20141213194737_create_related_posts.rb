class CreateRelatedPosts < ActiveRecord::Migration
  def change
    create_table :related_posts do |t|
      t.references :post, index: true
      t.references :bucket, index: true
      t.text :notes

      t.timestamps
    end
  end
end
