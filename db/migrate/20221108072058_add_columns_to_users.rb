class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :text
    add_column :users, :is_stopped, :boolean, default: false
  end
end
