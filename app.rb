require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

configure do
  enable :cross_origin
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

helpers do
  def recentLocationsAndTweets(name)
      hashname="#"+"#{name}"
      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "enter your key"
	  config.consumer_secret     = "enter your token"
	  config.access_token        = "enter your token"
	  config.access_token_secret = "enter your token secret"
      end
      puts name
	  loc_list = []
      client.search(hashname, result_type: "recent").take(100).collect do |tweet|
      loc_hash = {:location => "#{tweet.user.location}", :tweet => "#{tweet.text}", :user =>  "#{tweet.user.screen_name}"}
	  loc_list.push(loc_hash)
      end
	  final_hash = {:locAndTweets => loc_list}
      return final_hash
  end

end

get '/locandtweet/:name' do
  content_type :json
  JSON.pretty_generate(recentLocationsAndTweets(params['name']))
end
