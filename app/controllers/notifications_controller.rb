class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @notification = Notification.new
  end

  def show
    redirect_to root_url
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :index, status: :created, location: @notification }
        NewsMailer.index.deliver
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
