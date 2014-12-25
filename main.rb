require 'open-uri'
require_relative 'cipher'

dic = File.read("dictionary.txt")
dic = File.read(open("http://tools.ietf.org/html/rfc1034"))
text = File.read("message.txt")

cipher = BookCipher.new(dic: dic)

code = cipher.encrypt(text: text)
puts "Code is: #{code}"

message = cipher.decrypt(code)
puts "Decrypted message is: #{message}"

