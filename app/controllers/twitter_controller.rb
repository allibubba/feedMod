class TwitterController < ApplicationController

	require 'rubygems'
	require 'tweetstream'
	require 'yajl'
	require 'pp'

	def index
		TweetStream::Client.new('zeroninelab','4092use').sample do |status|
		  puts "[#{status.user.screen_name}] #{status.text}"
		end
	end
end
