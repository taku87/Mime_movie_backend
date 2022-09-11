class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :number
      t.string :title, null: false
      t.text :description
      t.string :category
      t.string :video_url
      t.integer :video_length

      t.timestamps
      t.datetime :published_at
      t.datetime :deleted_at
    end
  end
end
