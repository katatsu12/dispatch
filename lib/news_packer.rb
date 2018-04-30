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
        b = news_taker_daily(params_arr[index][0] ,params_arr[index][1] ) #take array with news

        @news_labels <<  params_arr[index][1] + ':'

        [*0..2].each do |x| #pack 3 of them
          arr_with_news << b[2][1][x]
        end

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

    taged_news = TagedNews.where(user_id: current_user , status:  'ok')
    taged_news.each do |i|
      b = taged_news_weekly_taker(i.tag)

      @news_labels <<  i.tag + ':'

      [*0..2].each do |x| #pack 3 of them
        arr_with_news << b[2][1][x]
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
        b = news_taker_weekly(params_arr[index][0] ,params_arr[index][1] ) #take array with news

        @news_labels <<  params_arr[index][1] + ':'

        [*0..2].each do |x| #pack 3 of them
          arr_with_news << b[2][1][x]
        end

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

    taged_news = TagedNews.where(user_id: current_user , status:  'ok')
    taged_news.each do |i|
      b = taged_news_weekly_taker(i.tag)

      @news_labels <<  i.tag + ':'

      [*0..2].each do |x|
        arr_with_news << b[2][1][x]
      end
    end
    return arr_with_news
  end




  def self.get_labels
    return @news_labels
  end




  def self.news_taker_daily(country , category) #return array with daily news
    url = 'https://newsapi.org/v2/top-headlines?'\
          "country=#{country}&"\
          "category=#{category}&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
    req = open(url)
    response_body = req.read
    a = JSON.parse(response_body)
    b = a.to_a
    return b
  end




  def self.news_taker_weekly(country , category) #make url with weekly news
    date_now = Date.today
    week_ago = date_now - 7
    date_now_string = date_now.strftime("%Y-%m-%d")
    week_ago_string = week_ago.strftime("%Y-%m-%d")
    url = 'https://newsapi.org/v2/everything?'\
          "q=#{category}&"\
          "from=#{week_ago_string}&"\
          "to=#{date_now_string}&"\
          "language=#{country}&"\
          "sortBy=popularity&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
    req = open(url)
    response_body = req.read
    a = JSON.parse(response_body)
    b = a.to_a
    return b
  end




  def self.taged_news_daily_taker(category) #make url with daily news by tag
    date_now = Date.today
    week_ago = date_now - 1
    date_now_string = date_now.strftime("%Y-%m-%d")
    week_ago_string = week_ago.strftime("%Y-%m-%d")
    url = 'https://newsapi.org/v2/everything?'\
          "q=#{category}&"\
          "from=#{week_ago_string}&"\
          "to=#{date_now_string}&"\
          "language=en&"\
          "sortBy=popularity&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
    req = open(url)
    response_body = req.read
    a = JSON.parse(response_body)
    b = a.to_a
    return b
  end





  def self.taged_news_weekly_taker(category) #make url with weekly news by tag
    date_now = Date.today
    week_ago = date_now - 7
    date_now_string = date_now.strftime("%Y-%m-%d")
    week_ago_string = week_ago.strftime("%Y-%m-%d")
    url = 'https://newsapi.org/v2/everything?'\
          "q=#{category}&"\
          "from=#{week_ago_string}&"\
          "to=#{date_now_string}&"\
          "language=en&"\
          "sortBy=popularity&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
    req = open(url)
    response_body = req.read
    a = JSON.parse(response_body)
    b = a.to_a
    return b
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
    TagedNews.where(user_id: current_user).each do |i|
      if arr_with_choosed_news != "You are subscrivbed to this news: "
        arr_with_choosed_news << ", "
      end
      arr_with_choosed_news << i.tag
    end
    if arr_with_choosed_news == "You are subscrivbed to this news: "
      arr_with_choosed_news = "You are not subscrivbed to news"
    end
    return arr_with_choosed_news
  end


end
