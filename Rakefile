require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Opens the pry console"
task :console do
    Pry.start
end

desc "Launch server"
task :server do 
    exec 'bundle exec rerun -b rackup config.ru'
end