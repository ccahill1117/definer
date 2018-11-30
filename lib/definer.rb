class Word
  @@library = []
  @@counter = 1

  attr_accessor :word, :definition, :id, :antonym

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@counter
    @@counter = @@counter + 1
  end

  def self.all()
    @@library
  end

  def save()
    @@library.push(self)
  end

  fastidious = Word.new({:word=> "fastidious", :definition=> "very attentive to accuracy and detail"})
  circumspect = Word.new({:word=> "circumspect", :definition=> "very unwilling to take tasks"})
  repudiate = Word.new({:word=> "repudiate", :definition=> "to refuse to recognize as true"})
  benevolent = Word.new({:word=> "benevolent", :definition=> "kind or generous"})
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

  def self.delete_word(word_id)
  @@library.each do |word|
    if word.id == word_id
      @@library.delete(@@library[word_id])
    break
    else
      item.name = item.name
      item.rank = item.rank
    end
  end
end

end
