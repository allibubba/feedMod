  task :populate do
    Setting.destroy_all
    Setting.create(:status => 'pre')
    puts 'Setting Reset'
  end 
