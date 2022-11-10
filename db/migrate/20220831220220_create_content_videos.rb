class CreateContentVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :content_videos do |t|
      t.integer :number, null: false
      t.string :title, null: false
      t.text :description
      t.string :thumbnail
      t.string :youtube_url
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :published_at

      t.timestamps
    end
  end
end
