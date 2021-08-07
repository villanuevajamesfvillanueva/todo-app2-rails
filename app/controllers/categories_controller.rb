# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order('updated_at DESC')
    @category = Category.new
  end

  def edit
    @categories = current_user.categories.order('updated_at DESC')
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
        redirect_to categories_path, notice: 'Category was updated successfully.'
    else
        err_msg = '<div class="text-sm font-medium text-red-700 alert">Failed to update category.</div>'
        @category.errors.full_messages.each do |msg|
            err_msg += "<div class='flex-1 leading-snug text-sm text-red-600'>#{msg}</div>"
        end
        redirect_to request.referrer, alert: err_msg
    end
  end

  def create 
    @category = current_user.categories.build(category_params)

    if @category.valid?
        @category.save
        redirect_to request.referrer, notice: 'Category was created successfully.'
        
    else
        err_msg = '<div class="text-sm font-medium text-red-700 alert">Failed to create category.</div>'
        @category.errors.full_messages.each do |msg|
            err_msg += "<div class='flex-1 leading-snug text-sm text-red-600'>#{msg}</div>"
        end
        redirect_to request.referrer, alert: err_msg
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was deleted successfully.'
  end

  private
  def category_params
    params.require(:category).permit(:user_id, :title, :description, :color)
  end
end
