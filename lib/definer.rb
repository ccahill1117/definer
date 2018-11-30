class Word
  @@library = []

  attr_accessor :word, :definition

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)

  end

  def self.all()
    @@library
  end

  def save()
    @@library.push(self)
  end

end
