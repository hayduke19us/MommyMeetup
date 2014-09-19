class HomeController < ApplicationController
  include AttendanceMonitor

  def dashboard
    @names = members_info.keys
    @total_members = @names.count
    @past_events = past_events
    @total_attendance = get_total_attendance
  end
end
