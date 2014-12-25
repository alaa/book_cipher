class BookCipher

  def initialize(dic: dic)
    @dic = {}

    dic.to_chars.each_with_index do |key, value|
      @dic.key?(key) ? @dic[key] << value : @dic[key] = [value]
    end

    puts "dictionary size: #{dic.size}"
  end

  def encrypt(text: text)
    msg = text.to_chars
    code = []

    msg.each do |c|
      raise DictionaryNotSufficient unless dic.key?(c)

      random_char_index = dic[c].sample
      code << random_char_index
    end

    code.flatten.join('.')
  end

  def decrypt(code)
    msg = []

    code.split('.').each do |c|
      msg << dic.detect { |char, codes| codes.include?(c.to_i) }.first
    end

    msg.join
  end

  private
  attr_reader :dic
end

class String
  def to_chars
    self.split(//)
  end
end



