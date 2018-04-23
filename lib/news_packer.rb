require 'open-uri'
require 'news_packer'
module NewsPacker


  def self.news_packer(current_user)
    news_chooser = NewsChooser.where(user_id: current_user).last
    news_types = news_chooser.news_types.each_char.to_a
    index = 0

    params_arr = [ ['us' , 'business' ], ['us' , 'entertainment' ] ,
                    ['us' , 'health' ] , ['us' , 'science' ] ,
                    ['us' , 'sports' ] , ['us' , 'technology' ] ,
                    ['ua' , 'business' ] , ['ua' , 'entertainment' ] ,
                    ['ua' , 'health' ] , ['ua' , 'science' ] ,
                    ['ua' , 'sports' ] , ['ua' , 'technology' ]  ]
    statistics_rows = [ 'us_business' , 'us_entertainment'  ,
                        'us_health'  , 'us_science'  ,
                        'us_sports'  , 'us_technology'  ,
                        'ua_business'  , 'ua_entertainment'  ,
                        'ua_health'  , 'ua_science'  ,
                        'ua_sports'  , 'ua_technology'   ]

    arr_with_news = []#Array  with packed news

    news_types.each do |i|
      if i == "1"
        # -----------Pack news to array---------------------
        news_taker(params_arr[index][0] ,params_arr[index][1] ) #take url with news
        req = open(@url)
        response_body = req.read
        a = JSON.parse(response_body)
        b = a.to_a
        arr_with_news << b[2][1][0]
        arr_with_news << b[2][1][1]
        arr_with_news << b[2][1][2]
        #------------Statistic------------------------------
        news_type = Statistic.find(index + 1)
        inc =  news_type.sended_times + 1
        news_type.update(:sended_times => inc)

        index += 1
      else
        index += 1
      end

    end
    return arr_with_news
  end

  def self.news_taker(country , category) # ua news with params
    @url = 'https://newsapi.org/v2/top-headlines?'\
          "country=#{country}&"\
          "category=#{category}&"\
          "apiKey=#{Rails.application.secrets[:newsapi]}"
  end

  def self.choosed_news(current_user)
    news_chooser = NewsChooser.where(user_id: current_user).last
    news_types = news_chooser.news_types.each_char.to_a
    index = 0

    news_arr = [ 'us business' , 'us entertainment'  ,
                    'us health'  , 'us science'  ,
                    'us sports'  , 'us technology'  ,
                    'ua business'  , 'ua entertainment'  ,
                    'ua health'  , 'ua science'  ,
                    'ua sports'  , 'ua technology'   ]

    arr_with_choosed_news = "you are subscrivbed to this news :"

    news_types.each do |i|
      if i == "1"
        if arr_with_choosed_news != "you are subscrivbed to this news :"
          arr_with_choosed_news << ", "
        end
        arr_with_choosed_news << news_arr[index].to_s
        index += 1
      else
        index += 1
      end
    end

    if arr_with_choosed_news == "you are subscrivbed to this news :"
      arr_with_choosed_news = "you are not subscrivbed to news"
    end
    return arr_with_choosed_news
  end

end
