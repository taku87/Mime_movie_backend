class AddTranscodedVideoUrlToUsersVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :users_videos, :transcoded_video_url, :string
  end
end
