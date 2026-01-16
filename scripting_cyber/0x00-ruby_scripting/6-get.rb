# 6-get.rb
require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  # Print response status
  puts "Response status: #{response.code} #{response.message}\n\n"

  # Print response body as formatted JSON
  begin
    json_body = JSON.parse(response.body)
    puts "Response body:\n\n#{JSON.pretty_generate(json_body)}"
  rescue JSON::ParserError
    # If response is not JSON, just print raw body
    puts "Response body:\n\n#{response.body}"
  end
end
