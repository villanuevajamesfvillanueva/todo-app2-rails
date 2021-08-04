# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: :update_status

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.order('updated_at DESC')
  end

  # GET /tasks/1 or /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @tasks = current_user.tasks.order('updated_at DESC')
    @task = Task.new
    @current_user_categories = Category.where(user_id: current_user.id).order('updated_at DESC')
  end

  # GET /tasks/1/edit
  def edit
    @tasks = current_user.tasks.order('updated_at DESC')
    @task = Task.find(params[:id])
    @current_user_categories = Category.where(user_id: current_user.id).order('updated_at DESC')
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    if @task.valid?
        @task.save
        redirect_to request.referrer, notice: 'Task was created successfully.'
    else
        err_msg = '<div class="text-sm font-medium text-red-700 alert">Failed to create task.</div>'
        @task.errors.full_messages.each do |msg|
            err_msg += "<div class='flex-1 leading-snug text-sm text-red-600'>#{msg}</div>"
        end
        redirect_to request.referrer, alert: err_msg
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
        redirect_to new_task_path, notice: 'Task was updated successfully.'
    else
        err_msg = '<div class="text-sm font-medium text-red-700 alert">Failed to update task.</div>'
        @task.errors.full_messages.each do |msg|
            err_msg += "<div class='flex-1 leading-snug text-sm text-red-600'>#{msg}</div>"
        end
        redirect_to request.referrer, alert: err_msg
    end
  end

  def update_status
    @task = Task.find(params[:id])
    @task.update(status: params[:status])
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Task was successfully deleted.' }
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
