# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :category_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.date :deadline, null: false
      t.timestamps
    end
  end
end
