require 'tweetstream'
#require File.expand_path("/home/allibubba/Projects/feedMod/configcd/twitter.rb")


#run Padrino.application

TweetStream.configure do |config|
  config.consumer_key = 'WKkLcltTRfFdHqXFu0eZfQ'
  config.consumer_secret = 'y2EleG9d3oPC3D2JmYmeFEM0wiupAUD9HL9PqmoRwFg'
  config.oauth_token = '103706229-HWHSKP6zyx24UHIWLmQI8lAikM6Du77by1pj2Wq4'
  config.oauth_token_secret = 'fmvGuJzoKjAjtsX5cIFmIHzgmjUnOnfCoWManYMNk'
  config.auth_method = :oauth
end

# Use 'follow' to follow a group of user ids (integers, not screen names)
TweetStream::Client.new.follow(103706229) do |status|
  puts "#{status.text}"
end

#https://twimg0-a.akamaihd.net/profile_images/647496547/twitter-09.jpg

=begin
client = TweetStream::Daemon.new('e3-twitter-catcher')

client.on_error do |message|
  # Log error message somewhere
  puts "ERROR!"
  puts message
end.track('#xboxe3') do |status|
  # Do things when nothing's wrong
  t = Tweet.create!(:text => status.text, :name => status.user.name, :screen_name => status.user.screen_name, :profile_image_url => status.user.profile_image_url_https, :tweet_id => status.id, :lang  => status.user.lang, :status => 'unapproved')
end
=end
