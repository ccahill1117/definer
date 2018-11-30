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
  if (word == "") || (definition == "")
    @error = "you need to enter a name and a rank!"
    @library = Word.all()
  elsif Word.reject_double(word) == true
    @error = "name is already used"
    @library = Word.all()
  else
    @error = ""
    word = Word.new({:word=> word, :definition=> definition})
    word.save()
    @library = Word.all()
  end
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
  antonym = params["opposite"]
  alt_def = params["alt_def"]
  @word = Word.find(params[:id])
  @word.word = word
  @word.definition = definition
  @word.antonym = antonym
  @word.alt_definition = alt_def
  erb(:word)
end

post('/words/<%= @word.id %>') do
  delete_word = Word.find(params[:id])
  Word.delete_word(delete_word)
  erb(:item)
end
