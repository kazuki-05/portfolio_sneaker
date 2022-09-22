class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      # 誰が投稿したかを表示するためのカラム
      t.integer :user_id
      # ブランドを投稿できる用のカラム
      t.integer :brand_id
      t.timestamps
    end
  end
end
