class CreateUsersVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :users_videos do |t|
      t.string :number
      t.string :video_url
      t.integer :content_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
