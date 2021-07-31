# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order('updated_at DESC')
    @category = Category.new
  end

  def create 
    @category = current_user.categories.build(category_params)

    if @category.valid?
        @category.save
        redirect_to request.referrer, notice: 'Category was created successfully.'
        
    else
        render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to request.referrer, notice: 'Category was deleted successfully.'
  end

  private
  def category_params
    params.require(:category).permit(:user_id, :title, :description)
  end
end
