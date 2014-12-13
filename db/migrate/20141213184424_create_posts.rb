class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :portal
      t.text :data

      t.timestamps
    end
  end
end
