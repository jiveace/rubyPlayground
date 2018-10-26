require 'rubygems'
require 'httparty'

# class Resty
#   include HTTParty
#   base_uri = "edutechional-resty.herokuapp.com"
#
#   def posts
#     self.class.get("/posts.json")
#   end
# end
#
# resty = Resty.new
# puts resty.posts

response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
puts response.message

class StackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service)
    @options = {query: {site: service}}
  end

  def questions
    self.class.get('/2.2/questions', @options)
  end

  def users
    self.class.get('/2.2/users', @options)
  end
end

se = StackExchange.new('stackoverflow')
puts se.users
