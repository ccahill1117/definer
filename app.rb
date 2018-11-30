require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definer')


get ('/') do
  @test = "hello"
  erb(:input)
end
