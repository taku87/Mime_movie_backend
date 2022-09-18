class CreateContentVideoTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :content_video_tag_relations do |t|
      t.integer :content_video_type, default: 0, null: false
      t.references :tag, foreign_key: true
      t.references :content_video, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
