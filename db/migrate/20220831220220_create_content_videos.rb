class CreateContentVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :content_videos do |t|
      t.string :number, null: false
      t.string :title, null: false
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :published_at

      t.timestamps
    end
  end
end
