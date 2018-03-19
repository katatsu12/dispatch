class NewsChooserController < ApplicationController
  before_action :authenticate_user! , :set_current_user

  def set_current_user
    NewsChooser.current_user = current_user.id
  end

  def index
    NewsChooser.before_index
    index_info
  end

  def send_email
    NewsMailer.index(current_user).deliver
  end

  #sites-----------------------------------------------------------------------

  def bbc
    news_id = 0
    NewsChooser.news_types_changer(news_id)
  end

  def tc
    news_id = 1
    NewsChooser.news_types_changer(news_id)
  end


  #us--------------------------------------------------------------------------

  def us_business
    news_id = 2
    NewsChooser.news_types_changer(news_id)
  end

  def us_entertainment
    news_id = 3
    NewsChooser.news_types_changer(news_id)
  end

  def us_health
    news_id = 4
    NewsChooser.news_types_changer(news_id)
  end

  def us_science
    news_id = 5
    NewsChooser.news_types_changer(news_id)
  end

  def us_sports
    news_id = 6
    NewsChooser.news_types_changer(news_id)
  end

  def us_technology
    news_id = 7
    NewsChooser.news_types_changer(news_id)
  end

  #ua--------------------------------------------------------------------------

  def ua_business
    news_id = 8
    NewsChooser.news_types_changer(news_id)
  end

  def ua_entertainment
    news_id = 9
    NewsChooser.news_types_changer(news_id)
  end

  def ua_health
    news_id = 10
    NewsChooser.news_types_changer(news_id)
  end

  def ua_science
    news_id = 11
    NewsChooser.news_types_changer(news_id)
  end

  def ua_sports
    news_id = 12
    NewsChooser.news_types_changer(news_id)
  end

  def ua_technology
    news_id = 13
    NewsChooser.news_types_changer(news_id)
  end

private
  def index_info
    @news_chooser = NewsChooser.where(user_id: current_user).last
    @a = @news_chooser.news_types.each_char.to_a
    @index = 0
    if Notification.where(user_id: current_user).count == 0
      @mail = "currently you dont have emaill. Please change it below"
    else
      @notification = Notification.where(user_id: current_user).last
      @mail = "your current emails is #{@notification.email}"
    end

    @news_a = ['bbc', 'tc' , 'us_business', 'us_entertainment', 'us_health' \
              , 'us_science', 'us_sports', 'us_technology', 'ua_business' \
              , 'ua_entertainment', 'ua_health', 'ua_science' , 'ua_sports' , 'ua_technology']
  end
end
