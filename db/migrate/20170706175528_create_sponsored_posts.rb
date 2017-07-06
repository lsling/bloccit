class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    create_table :sponsored_posts do |t|
      t.string :title
      t.text :body
      t.integer :price, default: 0.00
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
