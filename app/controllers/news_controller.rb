require 'open-uri'
require 'JSON'

class NewsController < ApplicationController
  def index
    url = 'https://newsapi.org/v2/top-headlines?'\
          'country=us&'\
          'apiKey=6dd59350f84a476490213e76baf5d95b'
    req = open(url)
    @response_body = req.read
    a = JSON.parse(@response_body)
    b = a.to_a
    c = b[2][1][0].to_json
    @z = JSON.parse(c)

    # render json: @response_body.status
    # render json: @response_body
    # render plain: @z['title']
  end
end
