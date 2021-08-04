# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'

  validates :title, :body, :deadline, presence: true
end
