	require 'rubygems'
	require 'tweetstream'
	require 'yajl'
	require 'pp'

		puts "***********************"
		TweetStream.configure do |config|
		  config.consumer_key = 'WKkLcltTRfFdHqXFu0eZfQ'
		  config.consumer_secret = 'y2EleG9d3oPC3D2JmYmeFEM0wiupAUD9HL9PqmoRwFg'
		  config.oauth_token = '103706229-HWHSKP6zyx24UHIWLmQI8lAikM6Du77by1pj2Wq4'
		  config.oauth_token_secret = 'fmvGuJzoKjAjtsX5cIFmIHzgmjUnOnfCoWManYMNk'
		  config.auth_method = :oauth
		end
		# my twitter ID: 103706229
		# Use 'follow' to follow a group of user ids (integers, not screen names)

		client = TweetStream::Client.new
		client.on_error do |message|
		  puts message
		end

		client.track("#roundhouse") do |status|
		  puts "#{status.text}"
		  puts ""
		end
