class AddSubToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sub, :string, null: false
  end
end
