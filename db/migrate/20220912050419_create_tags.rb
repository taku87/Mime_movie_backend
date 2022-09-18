class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :tags, :name, unique: true
  end
end
