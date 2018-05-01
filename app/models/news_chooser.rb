class NewsChooser < ApplicationRecord
  belongs_to :user

  def self.news_types_changer(news_id, current_user)
    @news_chooser = NewsChooser.where(user_id: current_user).last
    a = @news_chooser.news_types.each_char.to_a

    a[news_id] = if a[news_id] == '0'
                   '1'
                 else
                   '0'
                 end

    b = a.join
    @news_chooser.update!(news_types: b)
  end

  def self.send_daily_changer(current_user)
    @send_choose = NewsChooser.where(user_id: current_user).last
    a = @send_choose.send_daily

    a = if a == 0
          1
        else
          0
        end

    @send_choose.update!(send_daily: a)
  end

  def self.send_weekly_changer(current_user)
    @send_choose = NewsChooser.where(user_id: current_user).last
    a = @send_choose.send_weekly

    a = if a == 0
          1
        else
          0
        end

    @send_choose.update!(send_weekly: a)
  end
end
