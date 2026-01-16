# 6-get.rb
require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  # Response status
  puts "Response status: #{response.code} #{response.message}\n\n"

  # Response body in JSON format
  begin
    json_body = JSON.parse(response.body)
    print "Response body:\n\n#{JSON.pretty_generate(json_body)}"
  rescue JSON::ParserError
    # Eğer JSON değilse, raw body yaz
    print "Response body:\n\n#{response.body}"
  end
end

