require "net/https"
require "uri"
require "json"

module AttendanceMonitor
  extend ActiveSupport::Concern
  BASE = "https://api.meetup.com/"
  KEY = ENV["meetup_api_key"]
  GROUP = "momsmeetupofco"

  def get uri_object
    Net::HTTP.get_response(uri_object)
  end

  def parse body
    JSON.parse(body)
  end

  def members_info
    uri = URI.parse("#{BASE}2/members?sign=true&key=#{KEY}&group_urlname=#{GROUP}")
    response = get(uri)
    response = parse(response.body)
  end

  def members_count
    uri = URI.parse("#{BASE}2/groups?sign=true&key=#{KEY}&group_urlname=#{GROUP}")
    response = get(uri)
    response = parse(response.body)
    members ||= response["results"].first["members"]
  end

  def past_events
    "TODO"
  end

  def members_attendance
    "TODO"
  end

end
