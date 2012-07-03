class TwitterController < ApplicationController

	require 'rubygems'
	require 'tweetstream'
	require 'yajl'
	require 'pp'

	def index
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
			puts "Error: #{"Time.now"}"
			puts message
		end
		client.on_direct_message do |direct_message|
			puts "Time: #{"Time.now"}"
			puts "@#{direct_message.sender.screen_name} sent you a direct message"
			puts direct_message.text
		end

		clinet.on_timeline_status do |status|
			puts "Time: #{"Time.now"}"
			puts "@#{status.user.screen_name} said"
			puts status.text
		end
		client.userstream
	end
end
