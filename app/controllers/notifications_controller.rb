class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if Notification.where(user_id: current_user).count > 0
      @notification = Notification.where(user_id: current_user).last
      @mail = "your current emails is #{@notification.email}"
    else
      @mail = "Please write down your email below"
    end
  end

  def new
    @notification = current_user.notifications.build
  end

  def show
    redirect_to notifications_path
  end

  def edit
  end

  def update
    @notification = Notification.where(user_id: current_user).last
    @notification.update!(email:  params[:notification][:email])
    redirect_to notifications_path
  end

  def create
    @notification = current_user.notifications.build(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :index, status: :created, location: @notification }
        # NewsMailer.index.deliver
      else
        format.html { redirect_to @notification, notice: 'Your email is not looking good' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def notification_params
      params.permit(:email)
    end
end
