class CreateContentVideoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :content_video_comments do |t|
      t.text :body, null: false
      t.references :user, foreign_key: true
      t.references :content_video, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
