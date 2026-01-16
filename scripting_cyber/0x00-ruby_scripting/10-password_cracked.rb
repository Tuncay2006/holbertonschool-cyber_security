#!/usr/bin/env ruby
# 10-password_cracked.rb

require 'digest'

# Check arguments
if ARGV.length != 2
  puts "Usage: 10-passwordcracked.rb HASHEDPASSWORD DICTIONARY_FILE"
  exit 1
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

password_found = false

begin
  File.foreach(dictionary_file) do |line|
    word = line.strip
    hashed_word = Digest::SHA256.hexdigest(word)

    if hashed_word == hashed_password
      puts "Password found: #{word}"
      password_found = true
      break
    end
  end
rescue
  puts "Password not found in dictionary."
  exit 1
end

puts "Password not found in dictionary." unless password_found
