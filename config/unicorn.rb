# config/unicorn.rb
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 1)
timeout 15
preload_app true

# set path to app that will be used to configure unicorn,
@dir = "/var/www/personal_site"

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "#{@dir}/tmp/sockets/unicorn.personal_site.sock", :backlog => 64

# Set process id path
pid "#{@dir}/tmp/pids/unicorn-personal_site.pid"

# Set log file paths
stderr_path "#{@dir}/log/unicorn-personal_site.stderr.log"
stdout_path "#{@dir}/log/unicorn-personal_site.stdout.log"


before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
