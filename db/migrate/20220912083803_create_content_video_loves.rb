class CreateContentVideoLoves < ActiveRecord::Migration[5.2]
  def change
    create_table :content_video_loves do |t|
      t.references :user, foreign_key: true
      t.references :content_video, foreign_key: true

      t.timestamps
    end

    add_index :content_video_loves, [:user_id, :content_video_id], unique: true
  end
end
