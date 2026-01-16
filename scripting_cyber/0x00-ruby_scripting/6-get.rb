# 6-get.rb
require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  # Status
  puts "Response status: #{response.code} #{response.message}\n\n"

  # Response body in JSON format
  begin
    json_body = JSON.parse(response.body)
    # Sonundaki ekstra newline'i chomp ile kaldırıyoruz
    body_str = JSON.pretty_generate(json_body).chomp
    puts "Response body:\n\n#{body_str}"
  rescue JSON::ParserError
    # Eğer JSON değilse raw body yaz
    puts "Response body:\n\n#{response.body.chomp}"
  end
end
