class CreateContentVideoTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :content_video_tag_relations do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :content_video, null: false, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
