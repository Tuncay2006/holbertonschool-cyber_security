# 6-get.rb
require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  # Status
  puts "Response status: #{response.code} #{response.message}\n\n"

  # Body
  begin
    json_body = JSON.parse(response.body)
    # JSON.pretty_generate default olarak \n ekler. Sonundaki \n'yi kaldır
    body_str = JSON.pretty_generate(json_body).chomp
    puts "Response body:\n\n#{body_str}"
  rescue JSON::ParserError
    # JSON değilse raw body
    puts "Response body:\n\n#{response.body.chomp}"
  end
end
