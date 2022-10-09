class CreateCompletedVideoLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_video_likes do |t|
      t.references :user, foreign_key: true
      t.references :completed_video, foreign_key: true

      t.timestamps
    end
  end
end
