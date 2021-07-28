# frozen_string_literal: true

class AddingStatusColToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :string
  end
end
