class CreateContentVideoLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :content_video_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :content_video, null: false, foreign_key: true

      t.timestamps
    end

    add_index :content_video_likes, [:user_id, :content_video_id], unique: true
  end
end
