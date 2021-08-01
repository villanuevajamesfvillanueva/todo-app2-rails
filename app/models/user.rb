# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, :lastname, presence: true
  # validate :avatar_filesize
  # has_one_attached :avatar

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


#   private

#   def avatar_filetype
#     errors.add(:avatar, 'needs to be of the following format: JPEG, JPG, or PNG') if avatar.content_type.in?(%('image/jpeg image/jpg image/png image/JPEG image/JPG image/PNG'))
#   end

#   def avatar_filesize
#     errors.add(:avatar, 'file size should not exceed 1 MB!') if avatar.attached? && avatar.byte_size >= 1.megabyte
#   end
end
