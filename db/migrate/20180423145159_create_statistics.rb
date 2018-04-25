class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.string :news_type
      t.integer :sended_times
      t.integer :current_daily_subs
      t.integer :current_weekly_subs
      t.timestamps
    end
    Statistic.create(news_type:"us_business" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"us_entertainment" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"us_health" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"us_science" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"us_sports" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"us_technology" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")

    Statistic.create(news_type:"ua_business" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"ua_entertainment" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"ua_health" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"ua_science" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"ua_sports" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    Statistic.create(news_type:"ua_technology" , sended_times:"0" , current_daily_subs: "0", current_weekly_subs: "0")
    AdminUser.create(email: "admin@admin.admin" , password: "admin")
  end
end
