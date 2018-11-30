require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
also_reload('public/**/styles.css')
require('./lib/definer')


get ('/') do
  @library = Word.all()
  erb(:input)
end

post ('/') do
  word = params["word"]
  definition = params["def"]
  @library = Word.all()
  word = Word.new({:word=> word, :definition=> definition})
  word.save()
  erb(:input)
end

get ('/words/:id') do
  @word = Word.find(params[:id])
  @library = Word.all()
  erb(:word)
end

post('/words/:id') do
  word = params["word"]
  definition = params["def"]
  @word = Word.find(params[:id])
  @word.word = word
  @word.definition = definition
  erb(:word)
end

post('/words/<%= @word.id %>') do
  delete_word = Word.find(params[:id])
  Word.delete_word(delete_word)
  erb(:item)
end
