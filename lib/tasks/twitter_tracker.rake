namespace :twitter do
  desc 'import tweets'
  task :import do
  	puts ".............."
  	puts File.expand_path("lib/twitter_tracker.rb")
  	puts ".............."

    Process::exec('ruby '+ File.expand_path("lib/twitter_tracker.rb") + ' run')
  	puts "end"
  end
end
