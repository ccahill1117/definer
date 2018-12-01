require('definer')
require('rspec')

describe("Word") do
  it("creates a new word entry") do
    circumspect = Word.new({:word=> "circumspect", :definition=> "very unwilling to take tasks", :image=> ""})
    expect(circumspect.word()).to(eq("circumspect"))
  end
end

describe("Word#find") do
  it("finds a word based upon a provided word id, from default library") do
    expect(Word.find(1).word).to(eq("fastidious"))
  end
end

describe("Word#reject_double") do
  it("looks in current library to see if word has already been added") do
    expect(Word.reject_double("fastidious")).to(eq(true))
  end
end

describe("Word#delete_word") do
  it("deletes a word from the word library") do
    expect(Word.delete_word(1)).to(eq(nil))
  end
end
