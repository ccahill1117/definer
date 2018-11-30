require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
also_reload('public/**/*.css')
require('./lib/definer')


get ('/') do
  fastidious = Word.new({:word=> "fastidious", :definition=> "very attentive to accuracy and detail"})
  circumspect = Word.new({:word=> "circumspect", :definition=> "very unwilling to take tasks"})
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
