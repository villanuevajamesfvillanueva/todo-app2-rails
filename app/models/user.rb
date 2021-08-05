# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, :lastname, presence: true
  validate :avatar_filetype
  validate :avatar_filesize
  

  has_many :categories, dependent: :destroy
  has_many :tasks, through: :categories
  has_one_attached :avatar

  def unfinished
    tasks.where(status: 'unfinished').order('deadline ASC')
  end

  def in_progress
    tasks.where(status: 'in_progress').order('deadline ASC')
  end

  def completed
    tasks.where(status: 'completed').order('deadline ASC')
  end

  def thumbnail
    avatar.variant(gravity: "Center", resize: "50x50^", crop: '50x50+0+0')
  end


  private

  def avatar_filetype
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png image/jpg))
        errors.add(:avatar, 'must be a JPEG or PNG.')
    end
  end

  def avatar_filesize
    return if avatar.attached? == false
    errors.add(:avatar, 'file size should not exceed 1 MB!') if avatar.attached? && avatar.byte_size >= 1.megabyte
  end
end
