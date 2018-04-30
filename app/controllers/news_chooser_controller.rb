class NewsChooserController < ApplicationController
  before_action :authenticate_user!


  def index
    if Notification.where(user_id: current_user).count == 0
      redirect_to root_path
    else
      index_info
    end
  end

  def send_daily
    NewsChooser.send_daily_changer(current_user)
  end

  def send_weekly
    NewsChooser.send_weekly_changer(current_user)
  end

  # sites-----------------------------------------------------------------------
  #
  # def bbc
  #   news_id = 0
  #   NewsChooser.news_types_changer(news_id)
  # end
  #
  # def tc
  #   news_id = 1
  #   NewsChooser.news_types_changer(news_id)
  # end
  #

  # us--------------------------------------------------------------------------

  def us_business
    news_id = 0
    swap(news_id)
  end

  def us_entertainment
    news_id = 1
    swap(news_id)
  end

  def us_health
    news_id = 2
    swap(news_id)
  end

  def us_science
    news_id = 3
    swap(news_id)
  end

  def us_sports
    news_id = 4
    swap(news_id)
  end

  def us_technology
    news_id = 5
    swap(news_id)
  end

  # ua--------------------------------------------------------------------------

  def ua_business
    news_id = 6
    swap(news_id)
  end

  def ua_entertainment
    news_id = 7
    swap(news_id)
  end

  def ua_health
    news_id = 8
    swap(news_id)
  end

  def ua_science
    news_id = 9
    swap(news_id)
  end

  def ua_sports
    news_id = 10
    swap(news_id)
  end

  def ua_technology
    news_id = 11
    swap(news_id)
  end

  private

  def index_info
    news_chooser = NewsChooser.where(user_id: current_user).last
    @news_types = news_chooser.news_types.each_char.to_a
    @subed = NewsChooser.where(user_id: current_user).last
    if Notification.where(user_id: current_user).count == 0
      @mail = 'currently you dont have emaill. Please change it below'
    else
      notification = Notification.where(user_id: current_user).last
      @mail = "your current emails is #{notification.email}"
    end

    @news_labels = %w[us_business us_entertainment us_health
                      us_science us_sports us_technology ua_business
                      ua_entertainment ua_health ua_science ua_sports ua_technology]

    @tags = TagedNews.where(user_id: current_user)
  end

  def swap(news_id)
    NewsChooser.news_types_changer(news_id , current_user)
  end
end
