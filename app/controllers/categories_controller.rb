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
        redirect_to request.referrer, notice: 'Category was updated successfully.'
        
    else
        redirect_to request.referrer, alert: 'Failed to update category.'
    end
  end

  def create 
    @category = current_user.categories.build(category_params)

    if @category.valid?
        @category.save
        redirect_to request.referrer, notice: 'Category was created successfully.'
        
    else
        redirect_to request.referrer, alert: 'Failed to create category.'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to request.referrer, notice: 'Category was deleted successfully.'
  end

  private
  def category_params
    params.require(:category).permit(:user_id, :title, :description, :color)
  end
end
