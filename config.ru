# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__
get '/' do
  erb :home
end

run Sinatra::Application
