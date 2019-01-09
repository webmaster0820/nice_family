set :passenger_restart_with_touch, false # Note that `nil` is NOT the same as `false` here

set :application, "goldtime"
set :repo_url, "git@github.com:goldtime/ruby_on_rails.git"

set :deploy_to, '/home/deploy/ruby_on_rails'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

