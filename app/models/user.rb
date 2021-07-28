# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :tasks, through: :categories

  def unfinished
    tasks.where(status: 'unfinished').order('deadline ASC')
  end

  def in_progress
    tasks.where(status: 'in_progress').order('deadline ASC')
  end

  def completed
    tasks.where(status: 'completed').order('deadline ASC')
  end
end
