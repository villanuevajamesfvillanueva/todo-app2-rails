# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @tasks = current_user.tasks
    @task = Task.new
    @current_user_categories = Category.where(user_id: current_user.id).order(:title)
  end

  # GET /tasks/1/edit
  def edit
    @tasks = current_user.tasks
    @task = Task.find(params[:id])
    @current_user_categories = Category.where(user_id: current_user.id).order(:title)
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    if @task.valid?
        @task.save
        redirect_to request.referrer, notice: 'Task was created successfully.'
    else
        redirect_to request.referrer, alert: 'Failed to create task.'
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
    redirect_to request.referrer, notice: 'Task was created successfully.'
    else
    redirect_to request.referrer, alert: 'Failed to create task.'
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:category_id, :title, :body, :deadline, :status)
  end
end
