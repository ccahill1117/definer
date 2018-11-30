require('definer')
require('rspec')

describe("Word") do
  it("creates a new word entry") do
    circumspect = Word.new({:word=> "circumspect", :definition=> "very unwilling to take tasks"})
    expect(circumspect.word()).to(eq("circumspect"))
  end
end

describe("Word#find") do
  it("finds a word based upon a provided word id") do
    expect(Word.find(1).word).to(eq("fastidious"))
  end
end
