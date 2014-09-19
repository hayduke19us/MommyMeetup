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

  def get_info
    uri = URI.parse("#{BASE}2/members?sign=true&key=#{KEY}&group_urlname=#{GROUP}")
    response = get(uri)
    response = parse(response.body)
    response["results"].each do |n|
      $redis.hset('members', n['name'], n['id'])
    end
    members = $redis.hgetall('members')
    members
  end

  def members_info
    members = $redis.hgetall('members')
    if members.empty?
      return get_info
    else
      return members
    end
  end

  def get_events
    uri = URI.parse("#{BASE}2/events?sign=true&key=#{KEY}&group_urlname=#{GROUP}&status=past")
    response = get(uri)
    response = parse(response.body)
    response["results"].each do |n|
      $redis.hset('past_events', n['name'], n['id'])
    end
    events = $redis.hgetall('past_events')
    events
  end

  def past_events
    events = $redis.hgetall('past_events')
    if events.empty?
      return get_events
    else
      return events
    end
  end

  def attendace_record
    past_events.values.each do |id|
      get_attendance id
    end
  end

  def one_member
    member = members_info.keys.first
  end



  def get_total_attendance
    past_events.values.each do |event_id|
    end
    event_id = past_events.values.last
    uri = URI.parse("#{BASE}#{GROUP}/events/#{event_id}/attendance?sign=true&key=#{KEY}&filter=all")
    response = get(uri)
    response = parse(response.body)
    #$redis.hset("#{event_id}", "member", response['member'], "status", status)
    response
  end
end
