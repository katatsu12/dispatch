class NewsChooserController < ApplicationController


  def index
    if NewsChooser.where(user_id: current_user).count == 0
      NewsChooser.create(:news_types => '0'*14, :user_id => current_user.id).save
      @news_chooser = NewsChooser.where(user_id: current_user).last
      @notification = Notification.where(user_id: current_user).last
      @mail = "your current emails is #{@notification.email}"
    else
      @news_chooser = NewsChooser.where(user_id: current_user).last
      @notification = Notification.where(user_id: current_user).last
      @mail = "your current emails is #{@notification.email}"
    end
  end

  #sites-----------------------------------------------------------------------

  def bbc
    news_id = 0
    news_types_changer(news_id)
  end

  def tc
    news_id = 1
    news_types_changer(news_id)
  end


  #us--------------------------------------------------------------------------

  def us_business
    news_id = 2
    news_types_changer(news_id)
  end

  def us_entertainment
    news_id = 3
    news_types_changer(news_id)
  end

  def us_health
    news_id = 4
    news_types_changer(news_id)
  end

  def us_science
    news_id = 5
    news_types_changer(news_id)
  end

  def us_sports
    news_id = 6
    news_types_changer(news_id)
  end

  def us_technology
    news_id = 7
    news_types_changer(news_id)
  end

  #ua--------------------------------------------------------------------------

  def ua_business
    news_id = 8
    news_types_changer(news_id)
  end

  def ua_entertainment
    news_id = 9
    news_types_changer(news_id)
  end

  def ua_health
    news_id = 10
    news_types_changer(news_id)
  end

  def ua_science
    news_id = 11
    news_types_changer(news_id)
  end

  def ua_sports
    news_id = 12
    news_types_changer(news_id)
  end

  def ua_technology
    news_id = 13
    news_types_changer(news_id)
  end

private

  def news_types_changer(news_id)
    @news_chooser = NewsChooser.where(user_id: current_user).last
    a = @news_chooser.news_types.each_char.to_a

    if a[news_id] == '0'
      a[news_id] = '1'
    else
      a[news_id] = '0'
    end

    b = a.join
    @news_chooser.update!(:news_types =>  b)
    redirect_to root_url
  end
end
