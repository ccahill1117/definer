class Word
  @@library = []
  @@counter = 1

  attr_accessor :word, :definitions, :id, :alt_definition, :antonym, :image

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definitions = [attributes.fetch(:definition)]
    @image = attributes.fetch(:image)
    @id = @@counter
    @@counter = @@counter + 1
  end

  def self.all()
    @@library
  end

  def save()
    @@library.push(self)
  end

  fastidious = Word.new({:word=> "fastidious", :definition=> "very attentive to accuracy and detail", :image=> "https://i.pinimg.com/originals/cb/ca/e6/cbcae6d3a1a4ca315f31493eb35e4bc4.png"})
  circumspect = Word.new({:word=> "circumspect", :definition=> "very unwilling to take tasks", :image=> "https://static1.squarespace.com/static/5524448ee4b0d6f6b83ab9e2/t/57cf3de246c3c4d2933aa57c/1518795955078/?format=1500w"})
  repudiate = Word.new({:word=> "repudiate", :definition=> "to refuse to recognize as true", :image=> "https://i.pinimg.com/originals/cb/ca/e6/cbcae6d3a1a4ca315f31493eb35e4bc4.png"})
  benevolent = Word.new({:word=> "benevolent", :definition=> "kind or generous", :image=> "https://static1.squarespace.com/static/5524448ee4b0d6f6b83ab9e2/t/57cf3de246c3c4d2933aa57c/1518795955078/?format=1500w"})
  fastidious.save()
  circumspect.save()
  repudiate.save()
  benevolent.save()

  def self.find(id)
    word_id = id.to_i()
    @@library.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

  def self.delete_word(word)
    @@library.delete(word)
  end

  def self.sort_alphabetical
    @@library.sort_by {|word| word.word}
  end

  def self.reject_double(user_word)
    @@library.each do |word|
     if word.word === nil
       return false
     elsif word.word.include?(user_word)
       return true
     end
   end
  end

end
