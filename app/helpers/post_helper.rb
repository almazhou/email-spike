require 'json'
require "net/http"
require "uri"

module PostHelper

def self.post_to_endpoint(endpoint,post_params)
  uri = URI.parse(endpoint)
  # Convert the parameters into JSON and set the content type as application/json
  req = Net::HTTP::Post.new(uri.path)
  req.body = JSON.generate(post_params)
  req["Content-Type"] = "application/json"
  
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.start {|htt| htt.request(req)}
end
end
