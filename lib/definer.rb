class Word
  @@library = []
  @@counter = 1

  attr_accessor :word, :definition, :id

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

  def self.find(id)
    word_id = id.to_i()
    @@library.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

end
