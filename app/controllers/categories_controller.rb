# frozen_string_literal: true

class CategoriesController < ApplicationController

    def index
        @categories = current_user.categories.order("updated_at DESC")

    end
end
