rails_env = ENV['RAILS_ENV'] || 'development'

threads 4, 4

bind 'unix:///tmp/limlog.sock'
pidfile '/tmp/limlog.pid'
state_path '/tmp/limlog.state'

activate_control_app
