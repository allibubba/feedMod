class TwitterController < ApplicationController

	require 'rubygems'
	require 'tweetstream'
	require 'yajl'
	require 'pp'
	require 'rake'

	def index
		Rake::Task['twitter:stream'].invoke
	end
end
