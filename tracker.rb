	require 'rubygems'
	require 'tweetstream'
	require 'yajl'
	require 'pp'

TweetStream.configure do |config|
		  config.consumer_key = 'WKkLcltTRfFdHqXFu0eZfQ'
		  config.consumer_secret = 'y2EleG9d3oPC3D2JmYmeFEM0wiupAUD9HL9PqmoRwFg'
		  config.oauth_token = '103706229-HWHSKP6zyx24UHIWLmQI8lAikM6Du77by1pj2Wq4'
		  config.oauth_token_secret = 'fmvGuJzoKjAjtsX5cIFmIHzgmjUnOnfCoWManYMNk'
		  config.auth_method = :oauth
end

client = TweetStream::Client.new

client.sitestream(['103706229'], :followings => true) do |status|
  puts status.inspect
end
