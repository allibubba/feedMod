desc 'Clear Tweets'
task :clear_tweets do
  Tweet.destroy_all
end
