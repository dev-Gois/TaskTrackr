class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
    def index
      filter = params[:filter]
      @tasks = Task.where(user_id: session[:user_id])
      @atual = 'All tasks'

      case filter
      when 'no-date'
        @tasks = @tasks.where(date: nil)
        @atual = 'No date'
      when 'today'
        @tasks = @tasks.where(date: Date.today)
        @atual = 'Today'
      when 'this-week'
        @tasks = @tasks.where(date: Date.today.beginning_of_week..Date.today.end_of_week)
        @atual = 'This week'
      when 'this-month'
        @tasks = @tasks.where(date: Date.today.beginning_of_month..Date.today.end_of_month)
        @atual = 'This month'
      when 'favorites'
        @tasks = @tasks.where(favorited: true)
        @atual = 'Favorites'
      when 'completed'
        @tasks = @tasks.where(completed: true)
        @atual = 'Complete'
      when 'overdue'
        @tasks = @tasks.where("date < ?", Date.today).where(completed: false)
        @atual = 'Overdue'
      end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]

    if @task.save
      redirect_to tasks_path, notice: 'Task created!'
    else
      redirect_to tasks_path, alert: 'Erro: ' + @task.errors.full_messages.join(', ')
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true)
    redirect_to tasks_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.permit(:title)
    end
end
