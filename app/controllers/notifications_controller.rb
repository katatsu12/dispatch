class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  def show
    redirect_to root_url
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :index, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def notification_params
      params.permit(:email)
    end
end
