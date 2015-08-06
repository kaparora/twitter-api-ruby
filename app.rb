require 'sinatra'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

helpers do
  def recentLocationsAndTweets(name)
      hashname="#"+"#{name}"
      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "enter your key"
      config.consumer_secret     = "enter your secret"
      config.access_token        = "enter your token"
      config.access_token_secret = "enter your token secret"
      end
      puts name
      returnValue = client.search(hashname, result_type: "recent").take(100).collect do |tweet|
      "#{tweet.user.location}::#{tweet.text} by #{tweet.user.screen_name},"
      end
      return returnValue
  end

end

get '/locandtweet/:name' do
  recentLocationsAndTweets(params['name'])
end
