require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definer')
require('pry')


get ('/') do
  @library = Word.all()
  @library = Word.sort_alphabetical()
  erb(:input)
end

post ('/') do
  word = params["word"]
  definition = params["def"]
  image = ""
  if (word == "") || (definition == "")
    @error = "you need to enter a word and definition!"
    @library = Word.all()
    @library = Word.sort_alphabetical()
  elsif Word.reject_double(word) == true
    @error = "word is already used"
    @library = Word.all()
    @library = Word.sort_alphabetical()
  else
    @error = ""
    word = Word.new({:word=> word, :definition=> definition, :image=> image})
    word.save()
    @library = Word.all()
    @library = Word.sort_alphabetical()
  end
  erb(:input)
end

get ('/words/:id') do
  @word = Word.find(params[:id])
  @library = Word.all()
  erb(:word)
end

post ('/words/:id') do
  word = Word.find(params[:id])
  Word.delete_word(word)
  redirect('/')
end

post ('/words/:id/deletedef/:index') do
  @word = Word.find(params[:id])
  delete_index = params[:index].to_i()
  @word.definitions.delete_at(delete_index)
  erb(:word)
end

post('/words/:id/others') do
  word = params["word"]
  antonym = params["opposite"]
  image = params["image"]
  @word = Word.find(params[:id])
  @word.word = word
  @word.antonym = antonym
  @word.image = image
  erb(:word)
end

post('/words/:id/defs') do
  @word = Word.find(params[:id])
  addl_def = params["alt_def"]
  (@word.definitions).push(addl_def)
  erb(:word)
end

post('/words/<%= @word.id %>') do
  delete_word = Word.find(params[:id])
  Word.delete_word(delete_word)
  erb(:item)
end
