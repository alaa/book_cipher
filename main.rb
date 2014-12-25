require 'open-uri'
require_relative 'cipher'

online_text = File.read(open("http://tools.ietf.org/html/rfc1034"))
text = File.read("message.txt")

cipher = BookCipher.new(book: online_text)

100.times do
  code = cipher.encrypt(text: text)
  puts "Code is: #{code}"

  message = cipher.decrypt(code)
  puts "Decrypted message is: #{message}"
end

