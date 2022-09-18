class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :avatar
      t.integer :role, default: 0
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
