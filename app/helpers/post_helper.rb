require 'json'
require "net/http"
require "uri"

module PostHelper
  def self.post_email_to_ask_leave_api
    email_content = MailHelper.read_mail

    request_list = ExtractMailHelper.extract_leave_list(email_content[:subject])
   
    request_list.each do |request|
    request_post_params = {:employee_id => 1, :leave_request => request}
    PostHelper.post_to_endpoint("http://localhost:3000/employees/#{request_post_params[:employee_id]}/leave_requests",request_post_params)
    end
    
  end

def self.post_to_endpoint(endpoint,post_params)
  uri = URI.parse(endpoint)
  req = Net::HTTP::Post.new(uri.path)
  req.body = JSON.generate(post_params)
  req["Content-Type"] = "application/json"
  
  http = Net::HTTP.new(uri.host, uri.port)
  response = http.start {|htt| htt.request(req)}
end
end
