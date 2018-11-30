require('definer')
require('rspec')

describe("Word") do
  it("creates a new word entry") do
    circumspect = Word.new({:word=> "circumspect", :definition=> "very unwilling to take tasks"})
    expect(circumspect.word()).to(eq("circumspect"))
  end
end
