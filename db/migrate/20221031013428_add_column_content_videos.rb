class AddColumnContentVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :content_videos, :state, :integer, default: 0
  end
end
