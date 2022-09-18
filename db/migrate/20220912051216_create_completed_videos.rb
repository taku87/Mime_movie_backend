class CreateCompletedVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_videos do |t|
      t.references :user_video, foreign_key: true
      t.references :content_video, foreign_key: true
      t.string :number, null: false
      t.string :video_url, null: false
      t.string :user_title
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
