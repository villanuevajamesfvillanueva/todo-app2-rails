# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description
      t.timestamps
    end
  end
end
