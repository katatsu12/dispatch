require 'news_packer'
class NotificationsController < ApplicationController
  def index
    if Notification.where(user_id: current_user).count > 0
      @notification = Notification.where(user_id: current_user).last
      @mail = "your current emails is #{@notification.email}"
      @choosed_news = NewsPacker.choosed_news(current_user)
    else
      @mail = 'Before using our features write down your email below'
    end
  end

  def new
    @notification = current_user.notifications.build
  end

  def show
    redirect_to notifications_path
  end

  def edit; end

  def update
    @notification = Notification.where(user_id: current_user).last
    @notification.update!(email: params[:notification][:email])
    redirect_to notifications_path
  end

  def create
    @notification = current_user.notifications.build(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :index, status: :created, location: @notification }
      else
        format.html { redirect_to @notification, notice: 'Your email is not looking good' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def about
    @weekly_users = NewsChooser.where(send_weekly: 1).count
    @daily_users = NewsChooser.where(send_daily: 1).count

    @us_business = Statistic.find_by(news_type:"us_business").sended_times
    @us_entertainment = Statistic.find_by(news_type:"us_entertainment").sended_times
    @us_health = Statistic.find_by(news_type:"us_health").sended_times
    @us_science = Statistic.find_by(news_type:"us_science" ).sended_times
    @us_sports = Statistic.find_by(news_type:"us_sports").sended_times
    @us_technology = Statistic.find_by(news_type:"us_technology").sended_times

    @ua_business = Statistic.find_by(news_type:"ua_business").sended_times
    @ua_entertainment = Statistic.find_by(news_type:"ua_entertainment" ).sended_times
    @ua_health = Statistic.find_by(news_type:"ua_health").sended_times
    @ua_science = Statistic.find_by(news_type:"ua_science").sended_times
    @ua_sports = Statistic.find_by(news_type:"ua_sports").sended_times
    @ua_technology = Statistic.find_by(news_type:"ua_technology").sended_times
  end

  private

  def notification_params
    params.permit(:email)
  end
end
