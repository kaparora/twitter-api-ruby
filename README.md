# twitter-api-ruby
A Ruby REST API example to fetch location and tweet data from twitter for a given hashtag

In this small ruby app I am exposing a REST API using Sinatra which takes a hashtag input and returns location, tweet and user data in text comma separated format.

We can use this as a feed to a maps application and create markers to show location and tweets.

You will need to update  your credentails in app.rb file

      config.consumer_key        = "enter your key"
      config.consumer_secret     = "enter your token"
      config.access_token        = "enter your token"
      config.access_token_secret = "enter your token secret"
	  
Make sure you have bundler installed.
>gem install bundler

Run 

>bundle install 

to generate the Gemfile.lock and install all dependencies

To run the application, execute:
>bundle exec rackup -p 9292 config.ru

To test
1) Open browser
2) open url e.g. http://localhost:9292/locandtweet/netapp for #netapp

Result contains comma seperated location::tweet by tweeter information
