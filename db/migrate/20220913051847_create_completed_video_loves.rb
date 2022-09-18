class CreateCompletedVideoLoves < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_video_loves do |t|
      t.references :user, foreign_key: true
      t.references :completed_video, foreign_key: true

      t.timestamps
    end

    add_index :completed_video_loves, [:user_id, :completed_video_id], unique: true
  end
end
