class CreateUsersVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :users_videos do |t|
      t.string :video_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
