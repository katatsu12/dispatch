class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def method_name()
    app = Rpush::Gcm::App.new
    app.name = 'android_app'
    app.auth_key = 'AIzaSyBjQUyh-RKXtOLdUQAi1ygH2-spzGZMTX8'
    app.connections = 1
    app.save!
  end


  # GET /tasks
  # GET /tasks.json
  def index
    if Notification.where(user_id: current_user).count == 0
      redirect_to root_path
    else
      @tasks = Task.where(user_id: current_user).where(sended: 0).order(:time)
      @archived_tasks = Task.where(user_id: current_user).where(sended: 1).order(:time)
    end
  end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
    redirect_to tasks_path
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.update(:sended => 0)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :text, :time)
    end

end
