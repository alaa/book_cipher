class BookCipher
  SEPERATOR = "."

  def initialize(book: book)
    @codebook = {}

    book.to_chars.each_with_index do |key, value|
      codebook.key?(key) ? codebook[key] << value : codebook[key] = [value]
    end
  end

  def encrypt(text: text)
    msg = text.to_chars
    code = []

    msg.each do |c|
      raise DictionaryNotSufficient unless codebook.key?(c)

      random_char_index = codebook[c].sample
      code << random_char_index
    end

    code.flatten.join(SEPERATOR)
  end

  def decrypt(code)
    msg = []

    code.split(SEPERATOR).each do |c|
      msg << codebook.detect { |char, codes| codes.include?(c.to_i) }.first
    end

    msg.join
  end

  private
  attr_accessor :codebook
end

class String
  def to_chars
    self.split(//)
  end
end

