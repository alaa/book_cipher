require_relative 'cipher'

describe String do
  it "understands to_chars call" do
    expect("").to respond_to(:to_chars)
  end
end

describe BookCipher do
  let(:dic) { "abcdabcdea" }
  let(:text) { "ab" }
  subject { BookCipher.new(dic: dic) }

  it "encrypts the text" do
    code = subject.encrypt(text: text)
    expect([0,9,4,1,5]).to include(*code)
  end
end

