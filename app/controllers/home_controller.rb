# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    @categories = current_user.categories
  end
end
