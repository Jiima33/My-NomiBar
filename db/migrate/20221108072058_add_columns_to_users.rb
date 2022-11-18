# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :text
    add_column :users, :is_stopped, :boolean, default: false
    add_column :users, :gender, :integer, default: 0
  end
end
