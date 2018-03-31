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

  def self.send_choose_changer
    @send_choose = NewsChooser.where(user_id: current_user).last
    a = @send_choose.send_choose

    if a == 0
      a = 1
    else
      a = 0
    end

    @send_choose.update!(:send_choose =>  a)
  end

  def self.before_index
    if NewsChooser.where(user_id:  current_user).count == 0
         NewsChooser.create(:news_types => '0'*12, :send_choose => 0, :user_id => current_user).save
    end
  end
end
