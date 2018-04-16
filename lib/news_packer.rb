require 'open-uri'
require 'news_packer'
module NewsPacker


  def self.news_packer(current_user)
    news_chooser = NewsChooser.where(user_id: current_user).last
    news_types = news_chooser.news_types.each_char.to_a
    index = 0
    # @params_hash = Hash[  0 => Hash['us' , 'business' ] ,1 => Hash['us' , 'entertainment' ] ,
    #                       2 => Hash['us' , 'health' ] ,3 => Hash['us' , 'science' ] ,
    #                       4 => Hash['us' , 'sports' ] ,5 => Hash['us' , 'technology' ] ,
    #                       6 => Hash['us' , 'business' ] ,7 => Hash['us' , 'entertainment' ] ,
    #                       8 => Hash['us' , 'health' ] ,9 => Hash['us' , 'science' ] ,
    #                       10 => Hash['us' , 'sports' ] ,11 => Hash['us' , 'technology' ]]
    params_arr = [ ['us' , 'business' ], ['us' , 'entertainment' ] ,
                    ['us' , 'health' ] , ['us' , 'science' ] ,
                    ['us' , 'sports' ] , ['us' , 'technology' ] ,
                    ['ua' , 'business' ] , ['ua' , 'entertainment' ] ,
                    ['ua' , 'health' ] , ['ua' , 'science' ] ,
                    ['ua' , 'sports' ] , ['ua' , 'technology' ]  ]

    arr_with_news = []#Array  with packed news
    news_types.each do |i|
      if i == "1"
        news_taker(params_arr[index][0] ,params_arr[index][1] ) #take url with news

        req = open(@url)
        response_body = req.read
        a = JSON.parse(response_body)
        b = a.to_a
        arr_with_news << b[2][1][0]
        arr_with_news << b[2][1][1]
        arr_with_news << b[2][1][2]
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
        if index >= 1
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
