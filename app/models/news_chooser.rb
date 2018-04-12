class NewsChooser < ApplicationRecord
  cattr_accessor :current_user
  belongs_to :user



  def self.news_types_changer(news_id)
    @news_chooser = NewsChooser.where(user_id: current_user).last
    a = @news_chooser.news_types.each_char.to_a

    if a[news_id] == '0'
      a[news_id] = '1'
    else
      a[news_id] = '0'
    end

    b = a.join
    @news_chooser.update!(:news_types =>  b)
  end



  def self.send_daily_changer
    @send_choose = NewsChooser.where(user_id: current_user).last
    a = @send_choose.send_daily

    if a == 0
      a = 1
    else
      a = 0
    end

    @send_choose.update!(:send_daily =>  a)
  end

  def self.send_weekly_changer
    @send_choose = NewsChooser.where(user_id: current_user).last
    a = @send_choose.send_weekly

    if a == 0
      a = 1
    else
      a = 0
    end

    @send_choose.update!(:send_weekly =>  a)
  end

end
