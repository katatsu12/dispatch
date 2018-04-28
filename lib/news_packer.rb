require 'open-uri'
require 'news_packer'
module NewsPacker


  def self.news_packer_daily(current_user) #create array with daily news
    news_chooser = NewsChooser.where(user_id: current_user).last
    news_types = news_chooser.news_types.each_char.to_a
    index = 0

    params_arr = [ ['us' , 'business' ], ['us' , 'entertainment' ] ,
                    ['us' , 'health' ] , ['us' , 'science' ] ,
                    ['us' , 'sports' ] , ['us' , 'technology' ] ,
                    ['ua' , 'business' ] , ['ua' , 'entertainment' ] ,
                    ['ua' , 'health' ] , ['ua' , 'science' ] ,
                    ['ua' , 'sports' ] , ['ua' , 'technology' ]  ]


    arr_with_news = []#Array  with packed news
    @news_labels = []

    news_types.each do |i|
      if i == "1"
        # -----------Pack news to array---------------------
        news_taker_daily(params_arr[index][0] ,params_arr[index][1] ) #take url with news
        req = open(@url)
        response_body = req.read
        a = JSON.parse(response_body)
        b = a.to_a

        @news_labels <<  params_arr[index][1] + ':'
        arr_with_news << b[2][1][0]
        arr_with_news << b[2][1][1]
        arr_with_news << b[2][1][2]
        #------------Statistic------------------------------
        news_type = Statistic.find(index + 1)
        inc =  news_type.sended_times + 1
        news_type.update(:sended_times => inc)
        #------------Statistic current----------------------
        inc =  news_type.current_daily_subs + 1
        news_type.update(:current_daily_subs => inc)

        index += 1
      else
        index += 1
      end

    end
    return arr_with_news
  end

  def self.news_packer_weekly(current_user) #create array with weekly news
    news_chooser = NewsChooser.where(user_id: current_user).last
    news_types = news_chooser.news_types.each_char.to_a
    index = 0

    params_arr = [ ['en' , 'business' ], ['en' , 'entertainment' ] ,
                    ['en' , 'health' ] , ['en' , 'science' ] ,
                    ['en' , 'sports' ] , ['en' , 'technology' ] ,
                    ['ru' , 'business' ] , ['ru' , 'entertainment' ] ,
                    ['ru' , 'health' ] , ['ru' , 'science' ] ,
                    ['ru' , 'sports' ] , ['ru' , 'technology' ]  ]


    arr_with_news = []#Array  with packed news
    @news_labels = []

    news_types.each do |i|
      if i == "1"
        # -----------Pack news to array---------------------
        news_taker_weekly(params_arr[index][0] ,params_arr[index][1] ) #take url with news
        req = open(@url)
        response_body = req.read
        a = JSON.parse(response_body)
        b = a.to_a

        @news_labels <<  params_arr[index][1] + ':'
        arr_with_news << b[2][1][0]
        arr_with_news << b[2][1][1]
        arr_with_news << b[2][1][2]
        #------------Statistic------------------------------
        news_type = Statistic.find(index + 1)
        inc =  news_type.sended_times + 1
        news_type.update(:sended_times => inc)
        #------------Statistic current----------------------
        inc =  news_type.current_weekly_subs + 1
        news_type.update(:current_weekly_subs => inc)

        index += 1
      else
        index += 1
      end

    end
    return arr_with_news
  end

  def self.get_labels
    return @news_labels
  end

  def self.news_taker_daily(country , category)
    @url = 'https://newsapi.org/v2/top-headlines?'\
          "country=#{country}&"\
          "category=#{category}&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
  end

  def self.news_taker_weekly(country , category)
    date_now = Date.today
    week_ago = date_now - 7
    date_now_string = date_now.strftime("%Y-%m-%d")
    week_ago_string = week_ago.strftime("%Y-%m-%d")
    @url = 'https://newsapi.org/v2/everything?'\
          "q=#{category}&"\
          "from=#{week_ago_string}&"\
          "to=#{date_now_string}&"\
          "language=#{country}&"\
          "sortBy=popularity&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
  end


  def self.choosed_news(current_user) #main page subscribtion statistic
    news_chooser = NewsChooser.where(user_id: current_user).last
    news_types = news_chooser.news_types.each_char.to_a
    index = 0

    news_arr = [ 'us business' , 'us entertainment'  ,
                    'us health'  , 'us science'  ,
                    'us sports'  , 'us technology'  ,
                    'ua business'  , 'ua entertainment'  ,
                    'ua health'  , 'ua science'  ,
                    'ua sports'  , 'ua technology'   ]

    arr_with_choosed_news = "You are subscrivbed to this news: "

    news_types.each do |i|
      if i == "1"
        if arr_with_choosed_news != "You are subscrivbed to this news: "
          arr_with_choosed_news << ", "
        end
        arr_with_choosed_news << news_arr[index].to_s
        index += 1
      else
        index += 1
      end
    end

    if arr_with_choosed_news == "You are subscrivbed to this news: "
      arr_with_choosed_news = "You are not subscrivbed to news"
    end
    return arr_with_choosed_news
  end

end
