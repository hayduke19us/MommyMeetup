require "net/http"
require "uri"
require "symboltable"
require "json"

module AttendanceMonitor
  extend ActiveSupport::Concern
  BASE_ENDPOINT = "https://api.meetup.com/"

  def count_members
    uri = URI("#{BASE_ENDPOINT}2/members")
  end

end
