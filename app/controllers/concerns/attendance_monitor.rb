require "net/https"
require "uri"
require "symboltable"
require "json"

module AttendanceMonitor
  extend ActiveSupport::Concern
  BASE = "https://api.meetup.com/"
  KEY = ENV["meetup_api_key"]
  GROUP = "momsmeetupofco"

  def https_setup http
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def members_info
    uri = URI.parse("#{BASE}2/members?sign=true&key=#{KEY}&group_urlname=#{GROUP}")
    http = Net::HTTP.new(uri.host, uri.port)
    https_setup(http)
    request = Net::HTTP::GET.new(uri.request_uri)
    response = JSON.parse(response.body)
  end

  def members_count
    uri = URI.parse("#{BASE}2/groups?sign=true&key=#{KEY}&group_urlname=#{GROUP}")
    response = Net::HTTP.get_response(uri)
    response = JSON.parse(response.body) 
    response["results"].first["members"]

    #http = Net::HTTP.new(uri.host, uri.port)
    #https_setup(http)
    #response = Net::HTTP::Get.new(uri.request_uri)
    #response = JSON.parse(response.body)
  end


end
