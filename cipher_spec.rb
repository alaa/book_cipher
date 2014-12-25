require_relative 'cipher'

describe String do
  it "understands to_chars call" do
    expect("").to respond_to(:to_chars)
  end
end

describe BookCipher do
  let(:book) { "abcdabcdea" }
  let(:text) { "ab" }
  subject { BookCipher.new(book: book) }

  it "encrypts the text" do
    code = subject.encrypt(text: text)
    expect([0,9,4,1,5]).to include(*code.split('.').map(&:to_i))
  end

  it "decrypts the text" do
    code = '4.1'
    expect(subject.decrypt(code)).to eql text
  end
end

