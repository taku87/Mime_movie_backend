class CreateUserVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_videos do |t|
      t.references :user, foreign_key: true
      t.references :content_video, foreign_key: true
      t.string :number, null: false
      t.string  :content_number, null: false
      t.string :video_url, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
