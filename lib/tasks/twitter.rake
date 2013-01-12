namespace :twitter do


###############################
# Streaming                   #
###############################

	desc 'stream tweets'
	task :stream => :environment do

		require 'rubygems'
		require 'tweetstream'

		puts "#####################################"
		puts "#  Starting streaming twitter feed  #"
		puts "#####################################"
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
    	#t = Tweet.create!(:text => status.text, :name => status.user.name, :screen_name => status.user.screen_name, :profile_image_url => status.user.profile_image_url_https, :tweet_id => status.id, :lang  => status.user.lang, :status => 'unapproved')
    	t = Tweet.create!(:text => status.text, :user => status.user.screen_name)
			

    	# now respond to this tweet auto style
			Twitter.configure do |config|
			  config.consumer_key = 'WKkLcltTRfFdHqXFu0eZfQ'
	    	config.consumer_secret = 'y2EleG9d3oPC3D2JmYmeFEM0wiupAUD9HL9PqmoRwFg'
	    	config.oauth_token = '103706229-HWHSKP6zyx24UHIWLmQI8lAikM6Du77by1pj2Wq4'
	    	config.oauth_token_secret = 'fmvGuJzoKjAjtsX5cIFmIHzgmjUnOnfCoWManYMNk'
			end
			puts '*-*-*-*-*-*-*-*-*-*-*-*'
			puts status
			puts '*-*-*-*-*-*-*-*-*-*-*-*'

			Twitter.update("@#{status.user.screen_name} i'm right behind you")
		end
		

		puts "end"


	end

###############################
# Daemonizing                 #
###############################

	desc 'stream tweets as daemon'
	task :fire => :environment do

		#require 'rubygems'
		#require 'tweetstream'
		require "daemons"

		puts "#####################################"
		puts "#  calling script                   #"
		puts "#####################################"

		#exec('ruby '+ File.expand_path("sample/daemon.rb") + ' run')
		options = {
			:app_name   => "twitter-stream",
			#:ARGV       => ['start', '-f', '--', 'run'],
			:ARGV       => ['start', '-f', '--', 'run'],
			:dir_mode   => :script,
			:dir        => 'daemon',
			:multiple   => true,
			:ontop      => true,
			:mode       => :exec,
			:monitor    => true
		}

		Daemons.run(File.join(File.dirname(__FILE__), 'daemon.rb'), options)

	end




	desc 'Clear Tweets'
	task :destroy => :environment do
	  Tweet.destroy_all
	end
end
