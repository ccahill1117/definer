require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definer')


get ('/') do
  @test = "hello"
  erb(:input)
end

get ('/words/:id') do
  @word = Word.find(params[:id])
  @library = Word.all()
  
  erb(:word)
end
