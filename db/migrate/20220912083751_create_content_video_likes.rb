class CreateContentVideoLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :content_video_likes do |t|
      t.references :user, foreign_key: true
      t.references :content_video, foreign_key: true

      t.timestamps
    end
  end
end
 